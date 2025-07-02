
import 'package:flutter/cupertino.dart';

import '../utils/app_text_styles.dart';

class CustomHeaderCall extends StatelessWidget {
  const CustomHeaderCall({super.key, required this.text, required this.context});

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.buttonLarge20pxRegular(context)),
      ),
    ),
  );
}