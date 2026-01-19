// core/widgets/common/check_bullet_item.dart
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils/spacing.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class CheckBulletItem extends StatelessWidget {
  final String text;
  final bool isActive;

  const CheckBulletItem({
    super.key,
    required this.text,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? ColorsManager.success500 : ColorsManager.darkGray300;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: color,
            size: 18.sp,
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              text,
              style: context.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}