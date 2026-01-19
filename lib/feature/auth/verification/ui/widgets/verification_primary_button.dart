import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/primary/my_button.dart';


class VerificationPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;

  const VerificationPrimaryButton({
    super.key,
    required this.onPressed,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: enabled ? onPressed : null,
      height: 48.h,
      radius: 8.r,
      backgroundColor: ColorsManager.primaryColor,
      disabledColor: ColorsManager.dark200,
      label: 'التحقق',
      labelStyle:
      enabled ? TextStyles.font14White500Weight : TextStyles.font14Dark200400Weight,
    );
  }
}