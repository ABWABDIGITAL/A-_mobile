import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils/spacing.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class BackTextWithArrow extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const BackTextWithArrow({
    super.key,
    this.onTap,
    this.text = 'العودة',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            size: 18.sp,
            color: ColorsManager.black,
          ),
          horizontalSpace(4),
          Text(
            'العودة',
            style: TextStyles.font14Black500Weight,
          ),

        ],
      ),
    );
  }
}