import 'package:a_plus/core/theme/colors.dart';
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';

class VerificationFooterSection extends StatelessWidget {
  const VerificationFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'لم تستلم الرمز؟',
            style: context.bodySmall,
          ),
          horizontalSpace(4),
          InkWell(
            onTap: () {},
            child: Text(
              'إعادة إرسال الرمز',
              style: context.bodySmall?.copyWith(fontWeight: FontWeight.bold,color:ColorsManager.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}