import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class Tabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final bool isDark;

  const Tabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC8CDD6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
              (index) => Expanded(
            child: Row(
              children: [
                if (index > 0)
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: const Color(0xffC8CDD6),
                  ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(index == 0 ? 8 : 0),
                      bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                      topRight: Radius.circular(
                        index == tabs.length - 1 ? 8 : 0,
                      ),
                      bottomRight: Radius.circular(
                        index == tabs.length - 1 ? 8 : 0,
                      ),
                    ),
                    onTap: () => onTabSelected(index),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                        selectedIndex == index
                            ? isDark
                            ? AppColors.darkModeButtonsPrimary
                            : AppColors.lightModeButtonsPrimary
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8 ,
                          ),
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: AppTextStyles.buttonLarge20pxRegular(context),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

