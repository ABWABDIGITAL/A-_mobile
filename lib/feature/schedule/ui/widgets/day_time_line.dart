import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';

class DayTimeline extends StatelessWidget {
  const DayTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final times = [
      'schedule.time_9am',
      'schedule.time_10am',
      'schedule.time_11am',
      'schedule.time_12pm',
      'schedule.time_1pm',
      'schedule.time_2pm',
      'schedule.time_3pm',
      'schedule.time_4pm',
      'schedule.time_5pm',
      'schedule.time_6pm',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final slotHeight = availableHeight / times.length;

        return SingleChildScrollView(
          child: SizedBox(
            height: availableHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Labels Column
                SizedBox(
                  width: 52.w,
                  child: Column(
                    children: times.map((t) {
                      return SizedBox(
                        height: slotHeight,
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                t.tr(),
                                style: context.labelSmall?.copyWith(
                                  color: ColorsManager.darkGray300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Timeline with events
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Grid lines
                      Column(
                        children: List.generate(times.length, (index) {
                          return Container(
                            height: slotHeight,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: ColorsManager.grey200,
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      // Current time indicator
                      _CurrentTimeIndicator(
                        slotHeight: slotHeight,
                        startHour: 9,
                      ),

                      // Events
                      _ScheduleEventCard(
                        title: 'schedule.sample_event_title'.tr(),
                        time: 'schedule.sample_event_time_label'.tr(),
                        topOffset: slotHeight * 2.5,
                        height: (slotHeight * 2).clamp(60.h, 120.h),
                        color: ColorsManager.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CURRENT TIME INDICATOR
// ═══════════════════════════════════════════════════════════
class _CurrentTimeIndicator extends StatelessWidget {
  final double slotHeight;
  final int startHour;

  const _CurrentTimeIndicator({
    required this.slotHeight,
    required this.startHour,
  });

  @override
  Widget build(BuildContext context) {
    final now = TimeOfDay.now();
    final currentHour = now.hour + (now.minute / 60);
    final offset = (currentHour - startHour) * slotHeight;

    if (offset < 0 || offset > slotHeight * 10) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: offset,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: ColorsManager.errorColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: ColorsManager.errorColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SCHEDULE EVENT CARD - مُصلح
// ═══════════════════════════════════════════════════════════
class _ScheduleEventCard extends StatelessWidget {
  final String title;
  final String time;
  final double topOffset;
  final double height;
  final Color color;

  const _ScheduleEventCard({
    required this.title,
    required this.time,
    required this.topOffset,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topOffset,
      left: 4.w,
      right: 4.w,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border(
            left: BorderSide(
              color: color,
              width: 4,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxHeight < 50;

            if (isCompact) {
              // Compact layout for small heights
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.labelSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  horizontalSpace(8),
                  Text(
                    time,
                    style: context.labelSmall?.copyWith(
                      color: color.withOpacity(0.7),
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              );
            }

            // Normal layout
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: context.titleSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 12.sp,
                      color: color.withOpacity(0.7),
                    ),
                    horizontalSpace(4),
                    Flexible(
                      child: Text(
                        time,
                        style: context.labelSmall?.copyWith(
                          color: color.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}