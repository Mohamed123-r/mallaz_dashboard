import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../generated/assets.dart';

class LogInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Image.asset(Assets.imagesLoginImage, fit: BoxFit.cover),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesLogo,
                  height: 160,
                  width: 125,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24),
                Text('App Name', style: AppTextStyles.style40pxW700(context)),
                SizedBox(height: 4),
                Text(
                  'تسجيل دخول',
                  style: AppTextStyles.subtitleTitle20pxRegular(context),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        title: 'البريد الالكتروني',
                        hintText: "none@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 24),
                      CustomPasswordTextField(
                        title: "كلمة المرور",
                        hintText: "**********",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                MaterialButton(
                  height: 62,
                  minWidth: 380,
                  onPressed: () {},
                  color: AppColors.lightModeButtonsPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "تسجيل دخول",
                    style: AppTextStyles.buttonLarge20pxRegular(
                      context,
                    ).copyWith(color: AppColors.lightModeText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
