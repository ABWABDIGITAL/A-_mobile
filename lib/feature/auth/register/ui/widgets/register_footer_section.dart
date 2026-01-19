
import 'package:a_plus/core/theme/colors.dart';
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';

import '../../../login/ui/screens/login_screen.dart';

class RegisterFooterSection extends StatelessWidget {
  const RegisterFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'لديك حساب؟',
            style: context.bodySmall,
          ),
          horizontalSpace(4),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child: Text(
              'تسجيل الدخول',
              style: context.bodySmall?.copyWith(color: ColorsManager.primaryColor,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}