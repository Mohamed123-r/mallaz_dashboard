import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import 'home_item_bulider.dart';

class DataAnalysisSection extends StatelessWidget {
  const DataAnalysisSection({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      children: [
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome1,
          title: "303",
          subTitle: "اجمالي الوحدات",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome2,
          title: "100",
          subTitle: "الوحدات المباعة",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome3,
          title: "100",
          subTitle: "الوحدات المؤجرة",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome4,
          title: "103",
          subTitle: "الوحدات الفارغة",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome5,
          title: "303",
          subTitle: "كل المستخدمين",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome6,
          title: "303",
          subTitle: "المستخدمين الجدد ",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome7,
          title: "303",
          subTitle: "المستخدمين المحظورين",
        ),
        HomeItemBulider(
          isDark: isDark,
          image: Assets.imagesHome8,
          title: "303",
          subTitle: "ملاك الوحدات",
        ),
      ],
    );
  }
}
