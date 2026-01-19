import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/primary/my_text_field.dart';



class ForgotEmailField extends StatelessWidget {
  final TextEditingController controller;
  const ForgotEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField.email(
      controller: controller,
      label: 'البريد الإلكتروني',
      hintText: 'أدخل بريدك الإلكتروني',
      prefixIcon: const Icon(Icons.email_outlined),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'من فضلك أدخل اسمك الكامل';
        }
        return null;
      },
    );;
  }
}