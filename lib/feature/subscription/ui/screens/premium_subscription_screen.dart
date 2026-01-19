
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:a_plus/core/widgets/primary/my_svg.dart';
import 'package:a_plus/feature/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/check_bullet_item.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../home/ui/screens/main_bottom_nav_screen.dart';
import '../widgets/premium_plan_card.dart';

class PremiumSubscriptionScreen extends StatelessWidget {
  const PremiumSubscriptionScreen({super.key});

  void _onSubscribe() {}
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(32),
                const AppLogoHeader(),
                verticalSpace(32),
                Text(
                  'فتح الميزات المميزة',
                  style: context.headlineLarge,
                ),
                verticalSpace(8),
                Text(
                  'استفد من +A بأقصى قدر مع الوصول المميز',
                  style: context.bodySmall,
                ),
                verticalSpace(24),
                const PremiumPlanCard(),
                const Spacer(),
                MyButton(
                  onPressed: _onSubscribe,
                  height: 52.h,
                  backgroundColor: ColorsManager.primaryColor,
                  label: 'اشترك الآن',
                ),
                verticalSpace(12),
                Center(
                  child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MainBottomNavScreen())),
                    child: Text(
                      'استمر مع النسخة المجانية',
                      style: context.bodySmall?.copyWith(color: ColorsManager.primaryColor),
                    ),
                  ),
                ),
                verticalSpace(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

