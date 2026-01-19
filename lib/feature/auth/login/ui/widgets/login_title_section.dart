import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';


class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('login_title'),
          style: context.displaySmall,
        ),
        verticalSpace(4),
        Text(
          tr('login_subtitle'),
          style: context.bodySmall,
        ),
      ],
    );
  }
}