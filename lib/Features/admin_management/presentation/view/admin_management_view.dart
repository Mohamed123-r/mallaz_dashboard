import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_header_call.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/admin_cubit.dart';
import '../cubit/admin_state.dart';


class AdminManagementView extends StatefulWidget {
  const AdminManagementView({super.key});

  @override
  State<AdminManagementView> createState() => _AdminManagementViewState();
}

class _AdminManagementViewState extends State<AdminManagementView> {
  int currentPage = 1;
  final int rowsPerPage = 7;

  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().fetchAllAdmins();
  }

  void _onPageChanged(int page) {
    setState(() => currentPage = page);
    context.read<AdminCubit>().fetchAllAdmins();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                height: 62,
                minWidth: 250,
                onPressed: () {},
                color:
                    isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color:
                          isDark
                              ? AppColors.darkModeText
                              : AppColors.lightModeText,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      S.of(context).addNewAdmin,
                      style: AppTextStyles.buttonLarge20pxRegular(
                        context,
                      ).copyWith(
                        color:
                            isDark
                                ? AppColors.darkModeText
                                : AppColors.lightModeText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          BlocBuilder<AdminCubit, AdminState>(
            builder: (context, state) {
              if (state is AdminLoading) {
                return Expanded(child: const CustomLoading());
              } else if (state is AdminFailure) {
                return Center(child: Text(state.error));
              } else if (state is AdminSuccess) {
                final admins = state.admins;
                final int totalCount = admins.length;
                final int pageCount = ((totalCount / rowsPerPage).ceil()).clamp(
                  1,
                  1000,
                );
                final start = (currentPage - 1) * rowsPerPage;
                final end = (start + rowsPerPage).clamp(0, totalCount);
                final pagedAdmins = admins.sublist(start, end);

                return Column(
                  children: [
                    Table(
                      border: TableBorder.all(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.graysGray2,
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1.5),
                        1: FlexColumnWidth(1.8),
                        2: FlexColumnWidth(1.5),
                        3: FlexColumnWidth(1.5),
                        4: FlexColumnWidth(1.5),
                        5: FlexColumnWidth(1.8),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          children: [
                            CustomHeaderCall(
                              text: S.of(context).adminName,
                              context: context,
                            ),
                            CustomHeaderCall(
                              text: S.of(context).email,
                              context: context,
                            ),
                            CustomHeaderCall(
                              text: S.of(context).role,
                              context: context,
                            ),
                            CustomHeaderCall(
                              text: S.of(context).phoneNumber,
                              context: context,
                            ),
                            CustomHeaderCall(
                              text: S.of(context).status,
                              context: context,
                            ),
                            CustomHeaderCall(
                              text: S.of(context).actions,
                              context: context,
                            ),
                          ],
                        ),
                        ...pagedAdmins.map((admin) {
                          return TableRow(
                            children: [
                              CustomDataCell(
                                text: admin.userName,
                                context: context,
                              ),
                              CustomDataCell(
                                text: admin.email,
                                context: context,
                              ),
                              CustomDataCell(
                                text: S.of(context).admin,
                                context: context,
                              ),
                              CustomDataCell(
                                text: admin.phoneNumber,
                                context: context,
                              ),
                              CustomDataCell(
                                text:
                                    admin.isBlocked
                                        ? S.of(context).inactive
                                        : S.of(context).active,
                                context: context,
                              ),
                              ActionCell(
                                index: 0,

                                onView: () {
                                  showDialog(context: context, builder:
                                      (context) {
                                    return AlertDialog(
                                      backgroundColor: isDark
                                          ? AppColors.darkModeBackground
                                          : AppColors.lightModeBackground,


                                      title: Text(
                                                 S.of(context).adminDetails,
                                                 style: AppTextStyles
                                                     .subtitleTitle20pxRegular(
                                                   context,
                                      ),
                                               ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${S.of(context).adminName}: ${admin.userName}",
                                          ),
                                          Text(
                                            "${S.of(context).email}: ${admin.email}",
                                          ),
                                          Text(
                                            "${S.of(context).phoneNumber}: ${admin.phoneNumber}",
                                          ),
                                          Text(
                                            "${S.of(context).status}: ${admin.isBlocked ? S.of(context).inactive : S.of(context).active}",
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text(
                                            S.of(context).close,
                                            style: AppTextStyles
                                                .buttonLarge20pxRegular(
                                              context,
                                            ).copyWith(
                                              color: isDark
                                                  ? AppColors.darkModeAccent
                                                  : AppColors.lightModeAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  );
                                },
                                iDark: isDark,
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomPagination(
                      currentPage: currentPage,
                      onPageChanged: (val) => _onPageChanged(val),
                      pageCount: pageCount,
                    ),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class ActionCell extends StatelessWidget {
  final int index;
  final bool iDark;

  final VoidCallback onView;

  const ActionCell({
    super.key,
    required this.index,
    required this.onView,
    required this.iDark,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onView,
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesHugeiconsView,
                color:
                    iDark
                        ? AppColors.darkModeAccent
                        : AppColors.lightModeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
