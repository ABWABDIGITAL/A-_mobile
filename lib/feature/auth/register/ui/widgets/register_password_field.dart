import 'package:a_plus/core/widgets/primary/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';



class RegisterPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleObscure;

  const RegisterPasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      MyTextField.password(
        label: "كلمة المرور",
        hintText: "ادخل كلمة المرور"
      )
      ],
    );
  }
}