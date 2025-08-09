import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_header_call.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/theme_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/notification_cubit.dart';
import '../../cubit/notification_status.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return BlocListener<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is NotificationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).notificationSentSuccessfully)),
          );
        }
        if (state is NotificationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).newNotificationForm,
                style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                  color:
                      isDark
                          ? AppColors.darkModeButtonsPrimary
                          : AppColors.lightModeButtonsPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).notificationTitle,
                style: AppTextStyles.text14pxRegular(context),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: S.of(context).enterNotificationTitle,
                  filled: true,
                  fillColor:
                      isDark
                          ? AppColors.darkModeBackground
                          : AppColors.lightModeBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color:
                          isDark
                              ? AppColors.darkModeText
                              : AppColors.lightModeText,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).notificationText,
                style: AppTextStyles.text14pxRegular(context),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: descController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: S.of(context).enterNotificationText,
                  filled: true,
                  fillColor:
                      isDark
                          ? AppColors.darkModeBackground
                          : AppColors.lightModeBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color:
                          isDark
                              ? AppColors.darkModeText
                              : AppColors.lightModeText,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 400,
                      onPressed: () {
                        context.read<NotificationCubit>().sendNotification(
                          titleController.text,
                          descController.text,
                        );
                        titleController.clear();
                        descController.clear();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        S.of(context).send,
                        style: AppTextStyles.buttonLarge20pxRegular(
                          context,
                        ).copyWith(color: AppColors.black),
                      ),
                      color:
                          isDark
                              ? AppColors.darkModeButtonsPrimary
                              : AppColors.lightModeButtonsPrimary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              NotificationTableSection(
                isDark: isDark,
                onTapShowMore: (id) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("عرض تفاصيل الإشعار ID: $id")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTableSection extends StatefulWidget {
  const NotificationTableSection({
    super.key,
    required this.isDark,
    required this.onTapShowMore,
  });

  final bool isDark;
  final void Function(int id) onTapShowMore;

  @override
  State<NotificationTableSection> createState() =>
      _NotificationTableSectionState();
}

class _NotificationTableSectionState extends State<NotificationTableSection> {
  final int rowsPerPage = 10;
  int currentPage = 1;

  @override
  void initState() {
    context.read<NotificationCubit>().fetchNotifications(
      pageNumber: currentPage,
      pageSize: rowsPerPage,
    );
    super.initState();
  }

  void _onPageChanged(int page) {
    if (!mounted) return;
    setState(() => currentPage = page);
    context.read<NotificationCubit>().fetchNotifications(
      pageNumber: page,
      pageSize: rowsPerPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) return const CustomLoading();
        if (state is NotificationFailure) {
          return Center(child: Text(S.of(context).errorOccurred(state.error)));
        }
        if (state is NotificationListLoaded) {
          final notifications = state.notifications.data;
          final totalCount = state.notifications.totalCount;
          final pageCount = state.notifications.totalPage;

          return Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).previousNotifications,
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
                        text: S.of(context).title,
                        context: context,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).message,
                        context: context,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).sendDate,
                        context: context,
                      ),
                      CustomHeaderCall(
                        text: S.of(context).actions,
                        context: context,
                      ),
                    ],
                  ),
                  ...notifications.map(
                    (notification) => TableRow(
                      children: [
                        CustomDataCell(
                          text: notification.title,
                          context: context,
                        ),
                        CustomDataCell(
                          text: notification.description,
                          context: context,
                        ),
                        CustomDataCell(
                          text: notification.createdAt.toString(),
                          context: context,
                        ),
                        TableCell(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: MaterialButton(
                                height: 40,
                                minWidth: 100,
                                onPressed:
                                    () => widget.onTapShowMore(notification.id),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  S.of(context).showMore,
                                  style: AppTextStyles.buttonLarge20pxRegular(
                                    context,
                                  ).copyWith(color: AppColors.black),
                                ),
                                color: AppColors.graysGray3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
