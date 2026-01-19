
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../forgot_password/ui/screens/forgot_password_screen.dart';


class RememberForgotRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberForgotRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
              width: 20.h,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: ColorsManager.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                side: BorderSide(color: ColorsManager.dark200),
              ),
            ),
            horizontalSpace(6),
            Text(
              tr('remember_me'),
              style: TextStyles.font12DarkGray400Weight,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
          },
          child: Text(
            tr('forgot_password'),
            style: TextStyles.font12Blue400Weight,
          ),
        ),
      ],
    );
  }
}
