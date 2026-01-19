import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/primary/my_svg.dart';


class ForgotHeader extends StatelessWidget {
  const ForgotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
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
        ),
        verticalSpace(20),
        MySvg(
          image: 'purple_logo',
          width: 40.w,
          height: 40.w,
        ),
      ],
    );
  }
}