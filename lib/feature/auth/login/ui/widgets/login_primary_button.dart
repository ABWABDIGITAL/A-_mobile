import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/primary/my_button.dart';


class LoginPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginPrimaryButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      height: 48.h,
      radius: 8.r,
      backgroundColor: ColorsManager.primaryColor,
      label: tr('login'),
      labelStyle: TextStyles.font16White500Weight,
    );
  }
}