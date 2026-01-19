import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:a_plus/feature/subscription/ui/screens/premium_subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/back_text_with_arrow.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../widgets/join_community_card.dart';
import '../widgets/university_card.dart';

class ConfirmUniversityScreen extends StatelessWidget {
  const ConfirmUniversityScreen({super.key});

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
                BackTextWithArrow(),
                verticalSpace(20),
                AppLogoHeader(),
                verticalSpace(32),
                Text(
                  'أكّد جامعتك',
                  style: context.headlineLarge,
                ),
                verticalSpace(8),
                Text(
                  'تأكد أن هذه هي جامعتك وتخصصك',
                  style: context.bodySmall,
                ),
                verticalSpace(24),
                const UniversityCard(),
                verticalSpace(12),
                const JoinCommunityCard(),
                const Spacer(),
                MyButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumSubscriptionScreen()));
                  },
                  height: 52.h,
                  backgroundColor: ColorsManager.primaryColor,
                  label: 'متابعة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



