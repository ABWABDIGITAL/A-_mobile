import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:a_plus/core/widgets/primary/primary_back_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    final sections = [
      _NotificationSectionData(
        headerKey: 'notifications.section_now',
        items: const [
          _NotificationItemData(
            isRead: false,
          ),
        ],
      ),
      _NotificationSectionData(
        headerKey: 'notifications.section_time_1252',
        items: const [
          _NotificationItemData(
            isRead: false,
          ),
        ],
      ),
      _NotificationSectionData(
        headerKey: 'notifications.section_yesterday',
        items: const [
          _NotificationItemData(
            isRead: true,
          ),
          _NotificationItemData(
            isRead: true,
          ),
        ],
      ),
    ];

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _NotificationsHeader(),
              Expanded(
                child: sections.isEmpty
                    ? const _EmptyNotifications()
                    : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final section = sections[index];
                    return _NotificationSection(section: section);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationsHeader extends StatelessWidget {
  const _NotificationsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              const PrimaryBackIcon(),
              const Spacer(),
              Text(
                'notifications.title'.tr(),
                style: context.headlineSmall,
              ),
              const Spacer(),
              SizedBox(width: 32.w),
            ],
          ),
          verticalSpace(16),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'notifications.header'.tr(),
              style: context.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationSectionData {
  final String headerKey;
  final List<_NotificationItemData> items;

  const _NotificationSectionData({
    required this.headerKey,
    required this.items,
  });
}

class _NotificationItemData {
  final bool isRead;

  const _NotificationItemData({
    this.isRead = false,
  });
}

class _NotificationSection extends StatelessWidget {
  final _NotificationSectionData section;

  const _NotificationSection({required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(12),
        ...section.items.map(
              (item) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: _NotificationCard(
              item: item,
              timeKey: section.headerKey,
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final _NotificationItemData item;
  final String timeKey;

  const _NotificationCard({
    required this.item,
    required this.timeKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: ColorsManager.dark50,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: ColorsManager.primary50,
                shape: BoxShape.circle,
              ),
              child: MySvg(
                image: 'notification',
                width: 18.w,
                height: 18.w,
                color: ColorsManager.primaryColor,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'notifications.reminder_title'.tr(),
                    style: context.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    'notifications.reminder_body_line1'.tr(),
                    style: context.bodySmall?.copyWith(
                      color: ColorsManager.darkGray,
                    ),
                  ),
                  verticalSpace(2),
                  Text(
                    'notifications.reminder_body_line2'.tr(),
                    style: context.bodySmall?.copyWith(
                      color: ColorsManager.darkGray,
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(8),
            Text(
              timeKey.tr(),
              style: context.labelSmall?.copyWith(
                color: ColorsManager.darkGray300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: ColorsManager.grey100,
              shape: BoxShape.circle,
            ),
            child: MySvg(
              image: 'notification',
              width: 48.w,
              height: 48.w,
              color: ColorsManager.darkGray300,
            ),
          ),
          verticalSpace(16),
          Text(
            'notifications.empty_title'.tr(),
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(8),
          Text(
            'notifications.empty_subtitle'.tr(),
            style: context.bodySmall?.copyWith(
              color: ColorsManager.darkGray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}