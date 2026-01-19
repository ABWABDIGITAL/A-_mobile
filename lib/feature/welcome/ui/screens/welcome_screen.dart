import 'dart:ui' as ui;
import 'package:a_plus/core/helpers/utils/spacing.dart';
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../auth/login/ui/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  stops: const [0.3, 1.0],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 24.h,
                bottom: 24.h + MediaQuery.of(context).padding.bottom,
              ),
              child: Directionality(
                textDirection:
                isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment:
                      isArabic ?  Alignment.topRight :Alignment.topLeft,
                      child: MySvg(
                        image: 'logo',
                        width: 40.w,
                        height: 40.w,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'welcome.title'.tr(),
                      style: context.headlineMedium?.copyWith(color: ColorsManager.white,fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'welcome.subtitle'.tr(),
                      style: context.bodyMedium?.copyWith(color: ColorsManager.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 24.h),
                    MyButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      label: 'welcome.login'.tr(),
                      backgroundColor: ColorsManager.primaryColor,
                      height: 48.h,
                      radius: 12.r,
                    ),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'welcome.disclaimer'.tr(),
                        style: context.bodySmall?.copyWith(color: ColorsManager.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}