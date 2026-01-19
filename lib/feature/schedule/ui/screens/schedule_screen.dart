import 'dart:ui' as ui;
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/notification_bell_with_badge.dart';
import '../widgets/add_appointment_bottom_sheet.dart';
import '../widgets/day_time_line.dart';
import '../widgets/days_row.dart';
import '../widgets/schedule_search_field.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final TextEditingController _searchController = TextEditingController();

  late final List<DayItem> _days;
  int _selectedDayIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeDays();
  }

  void _initializeDays() {
    final today = DateTime.now();
    _days = List.generate(7, (i) {
      final d = today.add(Duration(days: i));
      return DayItem(
        date: d,
        weekdayKey: _weekdayKey(d.weekday),
        isToday: i == 0,
      );
    });
  }

  String _weekdayKey(int weekday) {
    const keys = {
      DateTime.saturday: 'schedule.day_sat',
      DateTime.sunday: 'schedule.day_sun',
      DateTime.monday: 'schedule.day_mon',
      DateTime.tuesday: 'schedule.day_tue',
      DateTime.wednesday: 'schedule.day_wed',
      DateTime.thursday: 'schedule.day_thu',
      DateTime.friday: 'schedule.day_fri',
    };
    return keys[weekday] ?? 'schedule.day_fri';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddAppointmentSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddAppointmentBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: const _ScheduleHeader(),
              ),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'schedule.title'.tr(),
                  style: context.headlineLarge,
                ),
              ),

              verticalSpace(16),

              // Search Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ScheduleSearchField(controller: _searchController),
              ),

              verticalSpace(16),

              // Days Row
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: DaysRow(
                  days: _days,
                  selectedIndex: _selectedDayIndex,
                  onSelected: (index) {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                ),
              ),

              verticalSpace(16),

              // Today Label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: _DayLabel(
                  selectedDay: _days[_selectedDayIndex],
                ),
              ),

              verticalSpace(8),

              // Timeline
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const DayTimeline(),
                ),
              ),

              verticalSpace(8),
            ],
          ),
        ),
        floatingActionButton: _AddAppointmentFAB(
          onTap: _showAddAppointmentSheet,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// HEADER
// ═══════════════════════════════════════════════════════════
class _ScheduleHeader extends StatelessWidget {
  const _ScheduleHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLogoHeader(),
        NotificationBellWithBadge(count: 5),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// DAY LABEL
// ═══════════════════════════════════════════════════════════
class _DayLabel extends StatelessWidget {
  final DayItem selectedDay;

  const _DayLabel({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    final label = selectedDay.isToday
        ? 'schedule.today'.tr()
        : '${selectedDay.weekdayKey.tr()} ${selectedDay.date.day}';

    return Row(
      children: [
        Text(
          label,
          style: context.titleLarge,
        ),
        const Spacer(),
        if (selectedDay.isToday)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: ColorsManager.primary50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              DateFormat('dd MMM', context.locale.languageCode)
                  .format(selectedDay.date),
              style: context.labelSmall?.copyWith(
                color: ColorsManager.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// FAB BUTTON
// ═══════════════════════════════════════════════════════════
class _AddAppointmentFAB extends StatelessWidget {
  final VoidCallback onTap;

  const _AddAppointmentFAB({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: ColorsManager.primaryColor,
      elevation: 4,
      child: MySvg(
        image: 'plus',
        width: 24.w,
        height: 24.w,
        color: ColorsManager.white,
      ),
    );
  }
}