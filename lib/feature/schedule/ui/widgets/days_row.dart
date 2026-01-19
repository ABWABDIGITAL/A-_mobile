import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';

class DayItem {
  final DateTime date;
  final String weekdayKey;
  final bool isToday;

  const DayItem({
    required this.date,
    required this.weekdayKey,
    this.isToday = false,
  });
}

class DaysRow extends StatelessWidget {
  final List<DayItem> days;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const DaysRow({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(end: 24.w),
        itemCount: days.length,
        separatorBuilder: (_, __) => horizontalSpace(10),
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected = index == selectedIndex;

          return _DayCard(
            day: day,
            isSelected: isSelected,
            onTap: () => onSelected(index),
          );
        },
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  final DayItem day;
  final bool isSelected;
  final VoidCallback onTap;

  const _DayCard({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 56.w,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryColor : ColorsManager.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? ColorsManager.primaryColor
                : ColorsManager.grey200,
            width: isSelected ? 0 : 1,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: ColorsManager.primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Weekday name
              Text(
                day.weekdayKey.tr(),
                style: context.labelSmall?.copyWith(
                  color: isSelected
                      ? ColorsManager.white.withOpacity(0.8)
                      : ColorsManager.darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(4),
              // Day number
              Text(
                day.date.day.toString(),
                style: context.titleMedium?.copyWith(
                  color: isSelected ? ColorsManager.white : ColorsManager.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Today indicator dot
              if (day.isToday) ...[
                verticalSpace(2),
                Container(
                  width: 5.w,
                  height: 5.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsManager.white
                        : ColorsManager.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}