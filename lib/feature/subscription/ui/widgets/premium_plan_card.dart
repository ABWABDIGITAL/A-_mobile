import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/check_bullet_item.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class PremiumPlanCard extends StatelessWidget {
  const PremiumPlanCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.dark200),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40.w,
                    height: 40.w,
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.primary50,
                    ),
                    child: MySvg(image: "bolt",height: 8,width: 8,)
                ),
                verticalSpace(8),
                Text(
                  'اشتراك النخبة',
                  style: context.bodyMedium,
                ),
                verticalSpace(12),
                Text(
                  '20 ريال شهريًا',
                  style: context.displaySmall,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8),
                Text(
                  'الدفع يتم بشكل آمن، ويمكنكم إلغاء الاشتراك متى رغبتم بذلك.',
                  style: context.bodySmall,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(16),
                Divider(color: ColorsManager.dark200, height: 1),
                verticalSpace(12),
                const CheckBulletItem(
                  text: 'ملاحظات ومهام غير محدودة',
                ),
                const CheckBulletItem(
                  text: 'حاسبة GPA المتقدمة',
                ),
                const CheckBulletItem(
                  text: 'الدعم ذو الأولوية',
                ),
                const CheckBulletItem(
                  text: 'مزامنة التقويم',
                ),
                const CheckBulletItem(
                  text: 'ميزات أخرى',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}