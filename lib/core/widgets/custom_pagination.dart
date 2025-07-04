import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../../generated/l10n.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final ValueChanged<int> onPageChanged;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onPageChanged,
  });

  List<Widget> _pageButtons(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(_numberButton(context, 1, isActive: currentPage == 1));

    int start = currentPage - 1;
    int end = currentPage + 1;

    if (start <= 1) {
      start = 2;
      end = 4;
    }
    if (end >= pageCount) {
      start = pageCount - 3;
      end = pageCount - 1;
    }
    start = start < 2 ? 2 : start;
    end = end >= pageCount ? pageCount - 1 : end;

    if (start > 2) {
      widgets.add(_dots());
    }

    for (int i = start; i <= end; i++) {
      if (i > 1 && i < pageCount) {
        widgets.add(_numberButton(context, i, isActive: currentPage == i));
      }
    }

    if (end < pageCount - 1) {
      widgets.add(_dots());
    }

    if (pageCount > 1) {
      widgets.add(
        _numberButton(context, pageCount, isActive: currentPage == pageCount),
      );
    }

    return widgets;
  }

  Widget _numberButton(
      BuildContext context,
      int number, {
        bool isActive = false,
      }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor:
          isActive
              ? isDark
              ? AppColors.darkModeButtonsPrimary
              : AppColors.lightModeButtonsPrimary
              : Colors.transparent,
          foregroundColor: AppColors.graysGray4,
          side: BorderSide(
            color: AppColors.graysGray4,
            width: isActive ? 2 : 1,
          ),
          minimumSize: const Size(36, 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: currentPage == number ? null : () => onPageChanged(number),
        child: Text(
          '$number',
          style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
            color: AppColors.graysGray4,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _dots() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '...',
        style: TextStyle(
          color: Color(0xFF33525C),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (pageCount <= 1) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color:
                currentPage == 1
                    ? AppColors.graysGray4
                    : isDark
                    ? AppColors.darkModeText
                    : AppColors.lightModeText,
              ),
              const SizedBox(width: 4),
              Text(
                S.of(context).previous,
                style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                  color:
                  currentPage == 1
                      ? AppColors.graysGray4
                      : isDark
                      ? AppColors.darkModeText
                      : AppColors.lightModeText,
                ),
              ),
            ],
          ),
          onPressed:
          currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
          splashRadius: 18,
        ),
        ..._pageButtons(context),
        IconButton(
          icon: Row(
            children: [
              Text(
                S.of(context).next,
                style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                  color:
                  currentPage == pageCount
                      ? AppColors.graysGray4
                      : isDark
                      ? AppColors.darkModeText
                      : AppColors.lightModeText,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color:
                currentPage == pageCount
                    ? AppColors.graysGray4
                    : isDark
                    ? AppColors.darkModeText
                    : AppColors.lightModeText,
              ),
            ],
          ),
          onPressed:
          currentPage < pageCount
              ? () => onPageChanged(currentPage + 1)
              : null,
          color: AppColors.graysGray4,
          splashRadius: 18,
        ),
      ],
    );
  }
}