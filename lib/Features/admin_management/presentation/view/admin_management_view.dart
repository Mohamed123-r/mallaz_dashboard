import 'package:book_apartment_dashboard/Features/admin_management/presentation/cubit/add_admin_state.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_functions/get_it.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_header_call.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/add_admin_repo.dart';
import '../cubit/add_admin_cubit.dart';
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

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
        child: BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            if (state is AdminLoading) {
              return const CustomLoading();
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        height: 62,
                        minWidth: 250,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BlocProvider(
                                create:
                                    (context) =>
                                    AddAdminCubit(repo: getIt.get<AddAdminRepo>()),
                                child: Builder(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        S.of(context).addNewAdmin,
                                        style: AppTextStyles.subtitleTitle20pxRegular(
                                          context,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Form(
                                          autovalidateMode: autovalidateMode,
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller: fullNameController,
                                                decoration: InputDecoration(
                                                  labelText: S.of(context).adminName,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return S.of(context).requiredField;
                                                  }
        
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 16),
                                              TextFormField(
                                                controller: phoneNumberController,
                                                decoration: InputDecoration(
                                                  labelText: S.of(context).phoneNumber,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return S.of(context).requiredField;
                                                  }
        
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 16),
                                              TextFormField(
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                  labelText: S.of(context).password,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return S.of(context).requiredField;
                                                  }
        
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 16),
                                              TextFormField(
                                                controller: confirmPasswordController,
                                                decoration: InputDecoration(
                                                  labelText:
                                                  S.of(context).confirmPassword,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return S.of(context).requiredField;
                                                  }
        
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text(
                                            S.of(context).cancel,
                                            style: AppTextStyles.buttonLarge20pxRegular(
                                              context,
                                            ).copyWith(
                                              color:
                                              isDark
                                                  ? AppColors.darkModeAccent
                                                  : AppColors.lightModeAccent,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (formKey.currentState!.validate()) {
                                              final password = passwordController.text;
                                              final confirmPassword =
                                                  confirmPasswordController.text;
        
                                              if (password != confirmPassword) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      S.of(context).passwordsDoNotMatch,
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }
        
                                              await     context.read<AddAdminCubit>().addAdmin(
                                                fullName:
                                                fullNameController.text.trim(),
                                                phoneNumber:
                                                phoneNumberController.text.trim(),
                                                password:
                                                passwordController.text.trim(),
                                                confirmPassword:
                                                confirmPasswordController.text
                                                    .trim(),
                                              );
        
                                              if (context.read<AddAdminCubit>().state
                                              is AddAdminSuccess) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      S
                                                          .of(context)
                                                          .adminAddedSuccessfully,
                                                    ),
                                                  ),
                                                );
                                              }
        
                                              if (context.read<AddAdminCubit>().state
                                              is AddAdminFailure) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      S.of(context).errorAddingAdmin,
                                                    ),
                                                  ),
                                                );
                                              }
        
        
                                              Navigator.pop(context);
                                            } else {
                                              setState(() {
                                                autovalidateMode =
                                                    AutovalidateMode.always;
                                              });
                                            }
                                          },
                                          child: Text(
                                            S.of(context).confirm,
                                            style: AppTextStyles.buttonLarge20pxRegular(
                                              context,
                                            ).copyWith(
                                              color:
                                              isDark
                                                  ? AppColors.darkModeAccent
                                                  : AppColors.lightModeAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ).then ((value) {
                            context.read<AdminCubit>().fetchAllAdmins();
        
                          })
                          ;
                        },
        
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
                  Table(
                    border: TableBorder.all(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.graysGray2,
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1.5),

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
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          isDark
                                              ? AppColors.darkModeBackground
                                              : AppColors
                                                  .lightModeBackground,
                                      title: Text(
                                        S.of(context).adminDetails,
                                        style:
                                            AppTextStyles.subtitleTitle20pxRegular(
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
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: Text(
                                            S.of(context).close,
                                            style: AppTextStyles.buttonLarge20pxRegular(
                                              context,
                                            ).copyWith(
                                              color:
                                                  isDark
                                                      ? AppColors
                                                          .darkModeAccent
                                                      : AppColors
                                                          .lightModeAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
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
