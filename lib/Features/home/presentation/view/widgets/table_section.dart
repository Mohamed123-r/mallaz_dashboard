import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_header_call.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/appointment_cubit.dart';
import '../../cubit/appointment_status.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key, required this.isDark});

  final bool isDark;

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  final int rowsPerPage = 10;
  int currentPage = 1;

  @override
  void initState() {
    context.read<AppointmentCubit>().fetchAppointments(
      pageNumber: currentPage,
      pageSize: rowsPerPage,
    );
    super.initState();
  }

  void _onPageChanged(int page) {
    if (!mounted) return;
    setState(() => currentPage = page);
    context.read<AppointmentCubit>().fetchAppointments(
      pageNumber: page,
      pageSize: rowsPerPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        if (state is AppointmentLoading) return const CustomLoading();
        if (state is AppointmentFailure) {
          return Center(child: Text(S.of(context).errorOccurred(state.error)));
        }
        if (state is AppointmentSuccess) {
          final appointments = state.appointments.data;
          final totalCount = state.appointments.totalCount;
          final pageCount = state.appointments.totalPage;

          return Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).pending,
                    style: AppTextStyles.subtitleTitle20pxRegular(
                      context,
                    ).copyWith(
                      color:
                          widget.isDark
                              ? AppColors.darkModeButtonsPrimary
                              : AppColors.lightModeButtonsPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "( ${totalCount.toString()} )",
                    style: AppTextStyles.subtitleTitle20pxRegular(
                      context,
                    ).copyWith(
                      color:
                          widget.isDark
                              ? AppColors.darkModeButtonsPrimary
                              : AppColors.lightModeButtonsPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Table(
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.graysGray2,
                ),
                children: [
                  TableRow(
                    children: [
                      CustomHeaderCall(
                        text: S.of(context).unitNumber,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).userName,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).phoneNumber,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).ownerName,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).phoneNumber,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).status,
                        context: null,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).actions,
                        context: null,
                      ),
                    ],
                  ),
                  ...appointments
                      .map(
                        (appointment) => TableRow(
                          children: [
                            CustomDataCell(
                              text: appointment.id.toString(),
                              context: context,
                            ),
                            CustomDataCell(
                              text: appointment.requesterName,
                              context: context,
                            ),
                            CustomDataCell(
                              text: appointment.requesterPhone,
                              context: context,
                            ),
                            CustomDataCell(
                              text: appointment.ownerName,
                              context: context,
                            ),
                            CustomDataCell(
                              text: appointment.ownerPhone,
                              context: context,
                            ),
                            CustomDataCell(
                              text: appointment.propertyType,
                              context: context,
                            ),

                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        borderRadius: BorderRadius.circular(8),
                                        child: SvgPicture.asset(
                                          Assets.imagesHugeiconsView,
                                          color:
                                              widget.isDark
                                                  ? AppColors.darkModeAccent
                                                  : AppColors.lightModeAccent,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        Assets.imagesBasilEditOutline,
                                        color:
                                            widget.isDark
                                                ? AppColors.darkModeAccent
                                                : AppColors.lightModeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      ,
                ],
              ),
              const SizedBox(height: 12),
              CustomPagination(
                currentPage: currentPage,
                pageCount: pageCount,
                onPageChanged: _onPageChanged,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
