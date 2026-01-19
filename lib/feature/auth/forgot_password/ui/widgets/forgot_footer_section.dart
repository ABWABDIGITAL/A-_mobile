import 'package:a_plus/core/theme/colors.dart';
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';


class ForgotFooterSection extends StatelessWidget {
  const ForgotFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          'العودة إلى تسجيل الدخول',
          style:context.bodySmall?.copyWith(fontWeight: FontWeight.bold,color: ColorsManager.primaryColor),
        ),
      ),
    );
  }
}