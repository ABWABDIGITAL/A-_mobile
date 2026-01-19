import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';


class ForgotTitleSection extends StatelessWidget {
  const ForgotTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نسيت كلمة المرور',
          style: context.displaySmall,
        ),
        verticalSpace(4),
        Text(
          'أدخل بريدك الإلكتروني لتلقي رمز التحقق',
          style: context.bodySmall,
        ),
      ],
    );
  }
}