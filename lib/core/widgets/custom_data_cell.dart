import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomDataCell extends StatelessWidget {
  const CustomDataCell({super.key, required this.text, required this.context});

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.text14pxRegular(context)),
      ),
    ),
  );
}
