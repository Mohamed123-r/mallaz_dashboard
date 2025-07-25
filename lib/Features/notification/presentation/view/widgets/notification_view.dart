import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/services/theme_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).newNotificationForm,
                            style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                              color: isDark
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
                            decoration: InputDecoration(
                              hintText: S.of(context).enterNotificationTitle,
                              filled: true,
                              fillColor: isDark
                                  ? AppColors.darkModeBackground
                                  : AppColors.lightModeBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: isDark
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
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: S.of(context).enterNotificationText,
                              filled: true,
                              fillColor: isDark
                                  ? AppColors.darkModeBackground
                                  : AppColors.lightModeBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: isDark
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

                        ],
                      ),

                    ),
                    const SizedBox(width: 36),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              S.of(context).gallery,
                              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                                color: isDark
                                    ? AppColors.darkModeButtonsPrimary
                                    : AppColors.lightModeButtonsPrimary,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    height: 286,
                                    color: AppColors.darkModeGrayText,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: AppColors.darkModeGrayText,
                                        height: 140,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: AppColors.darkModeGrayText,
                                        height: 140,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              height: 170,
                              width: double.infinity,
                              color: AppColors.darkModeGrayText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 50,
                        minWidth: 200,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          S.of(context).send,
                          style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        color: isDark
                            ? AppColors.darkModeButtonsPrimary
                            : AppColors.lightModeButtonsPrimary,
                      ),
                      const SizedBox(width: 20),
                      MaterialButton(
                        height: 50,
                        minWidth: 200,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          S.of(context).archive,
                          style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        color: AppColors.darkModeText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).previousNotifications,
                  style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                    color: isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                Table(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.graysGray2,
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(1.5),
                    2: FlexColumnWidth(1.5),
                    3: FlexColumnWidth(1.5),
                    4: FlexColumnWidth(1.5),
                    5: FlexColumnWidth(1.7),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(color: Colors.transparent),
                      children: [
                        HeaderCell(text: S.of(context).title),
                        HeaderCell(text: S.of(context).message),
                        HeaderCell(text: S.of(context).sendDate),
                        HeaderCell(text: S.of(context).status),
                        HeaderCell(text: S.of(context).group),
                        HeaderCell(text: S.of(context).actions),
                      ],
                    ),
                    ...List.generate(
                      6,
                          (index) => TableRow(
                        children: [
                          DataCell(text: "عروض سنويه", context: context),
                          DataCell(text: "احصل علي", context: context),
                          DataCell(text: "29-6-2025", context: context),
                          DataCell(text: S.of(context).sent, context: context),
                          DataCell(text: S.of(context).targetGroup, context: context),
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: MaterialButton(
                                  height: 40,
                                  minWidth: 100,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    S.of(context).showMore,
                                    style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                                      color: AppColors.black,
                                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DataCell extends StatelessWidget {
  const DataCell({super.key, required this.text, required this.context});

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.text14pxRegular(context)),
      ),
    ),
  );
}

class HeaderCell extends StatelessWidget {
  final String text;

  const HeaderCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}