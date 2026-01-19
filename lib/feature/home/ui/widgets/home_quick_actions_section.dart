import 'dart:ui' as ui;
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:a_plus/feature/notes/ui/screens/notes_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../tasks/screens/ui/tasks_screen.dart';

class HomeQuickActionsSection extends StatelessWidget {
  const HomeQuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home.quick_actions'.tr(),
            style: context.headlineSmall,
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuickActionItem(
                iconName: 'book-closed',
                bgColor: const Color(0xFF003DA5),
                labelKey: 'home.quick_materials',
                onTap: () {

                },
              ),
              QuickActionItem(
                iconName: 'check-done',
                bgColor: const Color(0xFF22D08B),
                labelKey: 'home.quick_tasks',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TasksScreen(),
                    ),
                  );
                },
              ),
              QuickActionItem(
                iconName: 'file',
                bgColor: const Color(0xFFC6C913),
                labelKey: 'home.quick_notes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotesScreen(),
                    ),
                  );
                },
              ),
              QuickActionItem(
                iconName: 'calculator',
                bgColor: const Color(0xFFEE1B34),
                labelKey: 'home.quick_gpa',
                onTap: () {
                  // TODO: فتح شاشة حاسبة المعدل
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final String iconName;
  final Color bgColor;
  final String labelKey;
  final VoidCallback? onTap;

  const QuickActionItem({
    super.key,
    required this.iconName,
    required this.bgColor,
    required this.labelKey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26.r),
      child: Column(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: bgColor.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: MySvg(
                image: iconName,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
          verticalSpace(8),
          SizedBox(
            width: 70.w,
            child: Text(
              labelKey.tr(),
              style: context.titleSmall,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}