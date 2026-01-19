import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class JoinCommunityCard extends StatelessWidget {
  const JoinCommunityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.dark200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: ColorsManager.success500,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'انضم إلى مجتمع جامعتك',
                      style: TextStyles.font14Dark500Weight,
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(
                  'تواصل مع الطلاب من جامعتك، انضم إلى المجموعات، واحصل على موارد خاصة بالجامعة.',
                  style: TextStyles.font12DarkGray400Weight,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}