import 'package:book_apartment_dashboard/Features/main/main_view.dart';
import 'package:book_apartment_dashboard/constant.dart';
import 'package:book_apartment_dashboard/core/database/cache/cache_helper.dart';
import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../data/repo/log_in_repo_impl.dart';
import '../cubit/log_in_cubit.dart';
import '../cubit/log_in_state.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  static const String routeName = 'LogInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(
            loginRepo: LoginRepoImpl(dioConsumer: DioConsumer(dio: Dio())),
          ),
      child: LogInBodyView(),
    );
  }
}

class LogInBodyView extends StatelessWidget {
  LogInBodyView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.loginModel.message)),
                    );
                    if (state.loginModel.data != null) {
                      CacheHelper().saveMap(
                        key: userData,
                        value: state.loginModel.data!.toJson(),
                      );
                    }
                    CacheHelper.sharedPreferences.setBool(isSuccessLogin, true);
                    Navigator.of(context).pushNamed(MainView.routeName);
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        width: 360,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        S.of(context).logIn,
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
                              title: S.of(context).phoneNumber,
                              hintText: "01000000000",
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                            ),
                            SizedBox(height: 24),
                            CustomPasswordTextField(
                              title: S.of(context).password,
                              hintText: "**********",
                              controller: passwordController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      MaterialButton(
                        height: 62,
                        minWidth: 380,
                        onPressed: () {
                          final email = emailController.text;
                          final password = passwordController.text;
                          if (email.isNotEmpty && password.isNotEmpty) {
                            context.read<LoginCubit>().login(email, password);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please fill all fields')),
                            );
                          }
                        },
                        color:
                            context.watch<ThemeCubit>().state == ThemeMode.dark
                                ? AppColors.darkModeButtonsPrimary
                                : AppColors.lightModeButtonsPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                            state is LoginLoading
                                ? CircularProgressIndicator(
                                  color:
                                      context.watch<ThemeCubit>().state ==
                                              ThemeMode.dark
                                          ? AppColors.darkModeText
                                          : AppColors.lightModeText,
                                )
                                : Text(
                                  S.of(context).logIn,
                                  style: AppTextStyles.buttonLarge20pxRegular(
                                    context,
                                  ).copyWith(
                                    color:
                                        context.watch<ThemeCubit>().state ==
                                                ThemeMode.dark
                                            ? AppColors.darkModeText
                                            : AppColors.lightModeText,
                                  ),
                                ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Image.asset(Assets.imagesLoginImage, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
