import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';

class VerificationTitleSection extends StatelessWidget {
  const VerificationTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تَحقّق',
          style: context.displaySmall,
          textAlign: TextAlign.start,
        ),
        verticalSpace(4),
        Text(
          'أدخل الرمز المكوّن من 6 أرقام والذي تم إرساله إلى بريدك الإلكتروني',
          style: context.bodySmall,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}