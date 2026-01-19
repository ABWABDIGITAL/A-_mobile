import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';

class ChatFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final int allCount;
  final int unreadCount;
  final ValueChanged<int> onChanged;

  const ChatFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.allCount,
    required this.unreadCount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _FilterTab(
                index: 0,
                selectedIndex: selectedIndex,
                label: 'chats.tab_all'.tr(),
                count: allCount,
                onTap: onChanged,
              ),
            ),
            Expanded(
              child: _FilterTab(
                index: 1,
                selectedIndex: selectedIndex,
                label: 'chats.tab_unread'.tr(),
                count: unreadCount,
                onTap: onChanged,
              ),
            ),
            Expanded(
              child: _FilterTab(
                index: 2,
                selectedIndex: selectedIndex,
                label: 'chats.tab_groups'.tr(),
                onTap: onChanged,
              ),
            ),
          ],
        ),
        // الخط الرمادي الكامل
        Container(
          height: 1,
          color: ColorsManager.grey200,
        ),
      ],
    );
  }
}

class _FilterTab extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final int? count;
  final ValueChanged<int> onTap;

  const _FilterTab({
    required this.index,
    required this.selectedIndex,
    required this.label,
    this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: context.titleSmall?.copyWith(
                    color: isSelected
                        ? ColorsManager.primaryColor
                        : ColorsManager.darkGray,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                if (count != null && count! > 0) ...[
                  horizontalSpace(6),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorsManager.primary50
                          : ColorsManager.grey100,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      count.toString(),
                      style: context.labelSmall?.copyWith(
                        color: isSelected
                            ? ColorsManager.primaryColor
                            : ColorsManager.darkGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: double.infinity,
            color: isSelected
                ? ColorsManager.primaryColor
                : ColorsManager.transparent,
          ),
        ],
      ),
    );
  }
}