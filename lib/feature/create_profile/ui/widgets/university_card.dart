import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class UniversityCard extends StatelessWidget {
  const UniversityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.primaryColor, width: 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 64.h,
            child: Center(
              child: Image.asset(
                'assets/images/King_saud_university.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          verticalSpace(12),
          Text(
            'جامعة الملك سعود',
            style: TextStyles.font16Black500Weight,
            textAlign: TextAlign.center,
          ),
          verticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: ColorsManager.darkGray300,
              ),
              SizedBox(width: 4.w),
              Text(
                'جدة، المملكة العربية السعودية',
                style: TextStyles.font12DarkGray400Weight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}