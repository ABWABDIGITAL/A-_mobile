import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/notification_bell_with_badge.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = 'home.greeting'.tr();
    final userName = 'home.name_placeholder'.tr();
    final university = 'home.university'.tr();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppLogoHeader(),
            NotificationBellWithBadge(count: 5,),
          ],
        ),
        verticalSpace(16),
        Text(
          '$greeting، $userName 👋',
          style: context.headlineMedium,
        ),
        verticalSpace(4),
        Row(
          children: [
            Icon(
              Icons.school_outlined,
              size: 16,
              color: ColorsManager.darkGray300,
            ),
            horizontalSpace(4),
            Text(
              university,
              style: context.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}