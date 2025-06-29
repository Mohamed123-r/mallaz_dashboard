import 'package:book_apartment_dashboard/Features/unit_management/presentation/view/sales_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/presentation/view/requests_to_add_new_properties.dart';

class SeatingView extends StatefulWidget {
  const SeatingView({super.key});

  @override
  State<SeatingView> createState() => _SeatingViewState();
}

class _SeatingViewState extends State<SeatingView> {
  int currentPage = 1;
  int totalPages = 5;
  final List<bool> isActiveList = [false, false, true, true, false];
  int selectedTabIndex = 0;

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
                      S.of(context).logIn,
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
              1: FlexColumnWidth(1.8),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(1.5),
              5: FlexColumnWidth(1.8),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Colors.transparent),
                children: [
                  HeaderCell(text: S.of(context).adminName, context: context),
                  HeaderCell(text: S.of(context).email, context: context),
                  HeaderCell(text: S.of(context).role, context: context),
                  HeaderCell(text: S.of(context).lastLogin, context: context),
                  HeaderCell(text: S.of(context).status, context: context),
                  HeaderCell(text: S.of(context).actions, context: context),
                ],
              ),
              ...List.generate(5, (index) {
                return TableRow(
                  children: [
                    DataCell(text: S.of(context).adminName, context: context),
                    DataCell(text: "admin@dashboard.com", context: context),
                    DataCell(text: S.of(context).admin, context: context),
                    DataCell(text: "17/6/2025", context: context),
                    DataCell(text: S.of(context).active, context: context),
                    ActionCell(
                      index: index,
                      isView: true,
                      onDelete: () {},
                      onView: () {},
                      iDark: isDark,
                    ),
                  ],
                );
              }),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed:
                    currentPage > 1
                        ? () => setState(() => currentPage--)
                        : null,
              ),
              const SizedBox(width: 8),
              Text('$currentPage ... $totalPages'),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed:
                    currentPage < totalPages
                        ? () => setState(() => currentPage++)
                        : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataCell extends StatelessWidget {
  const DataCell({super.key, required this.text, required this.context});

  final String text;
  final BuildContext context;

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
class ActionCell extends StatelessWidget {
  final int index;
  final bool isView;
  final bool iDark;
  final VoidCallback onDelete;
  final VoidCallback onView;

  const ActionCell({
    super.key,
    required this.index,
    this.isView = false,
    required this.onDelete,
    required this.onView,
    required this.iDark,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesHugeiconsView,
                color: iDark
                    ? AppColors.darkModeAccent
                    : AppColors.lightModeAccent,
              ),
            ),
            SvgPicture.asset(
              Assets.imagesBasilEditOutline,
              color: iDark
                  ? AppColors.darkModeAccent
                  : AppColors.lightModeAccent,
            ),

          ],
        ),
      ),
    );
  }
}