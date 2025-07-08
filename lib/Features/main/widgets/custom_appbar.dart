import 'package:book_apartment_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/theme_cubit.dart';
import '../../../core/services/locale_cubit.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../generated/l10n.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  OverlayEntry? _overlayEntry;

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Row(
              children: [
                SvgPicture.asset(Assets.imagesMenuIcon),
                const SizedBox(width: 32),
                Image.asset(Assets.imagesLogo, height: 54),


                const Spacer(),
                SizedBox(
                  width: 100,
                  child: DayNightSwitch(
                    value: !isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  ),
                ),
                const SizedBox(width: 24),
                CircleAvatar(radius: 28),
                const SizedBox(width: 12),
                Text(
                  S.of(context).adminName,
                  style: AppTextStyles.text14pxRegular(context),
                ),
                const SizedBox(width: 24),
                InkWell(
                  borderRadius: BorderRadius.circular(1200),
                  onTap: () {
                    _overlayEntry = OverlayEntry(
                      builder:
                          (context) => Stack(
                            children: [
                              GestureDetector(
                                onTap: _removeOverlay,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: AppColors.black.withAlpha(100),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: currentLanguage == "ar" ? 40 : null,
                                right: currentLanguage == "ar" ? null : 40,
                                child: Material(
                                  color: Colors.transparent,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color:
                                              isDark
                                                  ? AppColors.darkModeBackground
                                                  : AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    S.of(context).languages,
                                                    style:
                                                        AppTextStyles.subtitle16pxRegular(
                                                          context,
                                                        ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: _removeOverlay,
                                                    child: const Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<LocaleCubit>()
                                                    .setLocale('ar');
                                                _removeOverlay();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          16.0,
                                                        ),
                                                    child: Text(
                                                      S.of(context).arabic,
                                                      style: AppTextStyles.subtitle16pxRegular(
                                                        context,
                                                      ).copyWith(
                                                        color:
                                                            currentLanguage ==
                                                                    'ar'
                                                                ? AppColors
                                                                    .lightModeAccent
                                                                : null,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<LocaleCubit>()
                                                    .setLocale('en');
                                                _removeOverlay();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          16.0,
                                                        ),
                                                    child: Text(
                                                      S.of(context).english,
                                                      style: AppTextStyles.subtitle16pxRegular(
                                                        context,
                                                      ).copyWith(
                                                        color:
                                                            currentLanguage ==
                                                                    'en'
                                                                ? AppColors
                                                                    .lightModeAccent
                                                                : null,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: -20,
                                        left:
                                            currentLanguage == "ar" ? 20 : null,
                                        right:
                                            currentLanguage == "ar" ? null : 20,
                                        child: CustomPaint(
                                          size: const Size(40, 40),
                                          painter: TrianglePainter(
                                            isDark: isDark,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    );
                    Overlay.of(context).insert(_overlayEntry!);
                  },
                  child: Container(
                    width: 110,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(width: 1, color: AppColors.graysGray4),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        const Icon(Icons.keyboard_arrow_down_outlined),
                        Text(
                          currentLanguage == 'ar'
                              ? S.of(context).arabic
                              : S.of(context).english,
                          style: AppTextStyles.subtitle16pxRegular(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final bool isDark;

  TrianglePainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = isDark ? AppColors.darkModeBackground : AppColors.white
          ..style = PaintingStyle.fill;

    Path path =
        Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
