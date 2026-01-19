import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';

class RegisterTitleSection extends StatelessWidget {
  const RegisterTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إنشاء حساب',
          style: context.displaySmall,
        ),
        verticalSpace(4),
        Text(
          'سجل الآن للبدء',
          style: context.bodySmall,
        ),
      ],
    );
  }
}