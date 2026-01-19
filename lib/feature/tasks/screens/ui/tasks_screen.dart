import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/task_details_bottom_sheet.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<TaskItemData> _tasks = const [
    TaskItemData(
      titleKey: 'tasks.task1_title',
      descKey: 'tasks.task1_desc',
      timeKey: 'tasks.task1_time',
      isCompleted: false,
    ),
    TaskItemData(
      titleKey: 'tasks.task2_title',
      descKey: 'tasks.task2_desc',
      timeKey: 'tasks.task2_time',
      isCompleted: false,
    ),
    TaskItemData(
      titleKey: 'tasks.task3_title',
      descKey: 'tasks.task3_desc',
      timeKey: 'tasks.task3_time',
      isCompleted: false,
    ),
    TaskItemData(
      titleKey: 'tasks.task4_title',
      descKey: 'tasks.task4_desc',
      timeKey: 'tasks.task4_time',
      isCompleted: true,
    ),
    TaskItemData(
      titleKey: 'tasks.task5_title',
      descKey: 'tasks.task5_desc',
      timeKey: 'tasks.task5_time',
      isCompleted: true,
    ),
    TaskItemData(
      titleKey: 'tasks.task6_title',
      descKey: 'tasks.task6_desc',
      timeKey: 'tasks.task6_time',
      isCompleted: false,
    ),
  ];

  bool _showAll = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<TaskItemData> get _visibleTasks {
    final base = _showAll ? _tasks : _tasks.where((t) => t.isCompleted).toList();
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return base;
    return base.where((t) {
      final title = t.titleKey.tr().toLowerCase();
      return title.contains(query);
    }).toList();
  }

  void _showAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTaskBottomSheet(),
    );
  }

  void _showTaskDetails(TaskItemData item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => TaskDetailsBottomSheet(
        title: item.titleKey.tr(),
        subject: 'tasks.details_subject_example'.tr(),
        description: 'tasks.details_desc_example'.tr(),
        dateText: '12/10/2025',
        fromTimeText: '09:30',
        toTimeText: '11:30',
        isCompleted: item.isCompleted,
      ),
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TasksHeader(),
                verticalSpace(16),
                _TasksSectionHeader(),
                verticalSpace(12),
                _TasksSearchField(controller: _searchController),
                verticalSpace(12),
                _TasksFilterTabs(
                  showAll: _showAll,
                  onChanged: (value) {
                    setState(() {
                      _showAll = value;
                    });
                  },
                ),
                verticalSpace(16),
                Expanded(
                  child: _TasksList(
                    tasks: _visibleTasks,
                    onTaskTap: _showTaskDetails,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTaskSheet,
          backgroundColor: ColorsManager.primaryColor,
          child: MySvg(
            image: 'plus',
            width: 24.w,
            height: 24.w,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}

class TaskItemData {
  final String titleKey;
  final String descKey;
  final String timeKey;
  final bool isCompleted;

  const TaskItemData({
    required this.titleKey,
    required this.descKey,
    required this.timeKey,
    required this.isCompleted,
  });
}

class _TasksHeader extends StatelessWidget {
  const _TasksHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PrimaryBackIcon(),
        const Spacer(),
        Text(
          'tasks.title'.tr(),
          style: context.headlineSmall,
        ),
        const Spacer(),
        SizedBox(width: 32.w),
      ],
    );
  }
}

class _TasksSectionHeader extends StatelessWidget {
  const _TasksSectionHeader();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'tasks.section_title'.tr(),
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TasksSearchField extends StatelessWidget {
  final TextEditingController controller;

  const _TasksSearchField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField.search(
      controller: controller,
      hintText: 'tasks.search_hint'.tr(),
      borderRadius: 12.r,
      fillColor: ColorsManager.white,
      prefixIcon: Padding(
        padding: EdgeInsets.all(15.r),
        child: MySvg(
          image: 'search',
          width: 5.w,
          height: 5.w,
        ),
      ),
    );
  }
}

class _TasksFilterTabs extends StatelessWidget {
  final bool showAll;
  final ValueChanged<bool> onChanged;

  const _TasksFilterTabs({
    required this.showAll,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: ColorsManager.grey100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _FilterTab(
              label: 'tasks.filter_all'.tr(),
              isSelected: showAll,
              onTap: () => onChanged(true),
            ),
          ),
          horizontalSpace(4),
          Expanded(
            child: _FilterTab(
              label: 'tasks.filter_completed'.tr(),
              isSelected: !showAll,
              onTap: () => onChanged(false),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.white : ColorsManager.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: ColorsManager.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.labelMedium?.copyWith(
            color: isSelected ? ColorsManager.Green : ColorsManager.darkGray,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  final List<TaskItemData> tasks;
  final Function(TaskItemData) onTaskTap;

  const _TasksList({
    required this.tasks,
    required this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return _EmptyTasks();
    }

    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (_, __) => verticalSpace(8),
      itemBuilder: (context, index) {
        final item = tasks[index];
        return _TaskCard(
          item: item,
          onTap: () => onTaskTap(item),
        );
      },
    );
  }
}

class _TaskCard extends StatelessWidget {
  final TaskItemData item;
  final VoidCallback? onTap;

  const _TaskCard({
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsManager.grey200),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: item.isCompleted
                    ? ColorsManager.lightGreen
                    : ColorsManager.primary50,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: MySvg(
                  image: item.isCompleted ? 'check-done' : 'task',
                  width: 22.w,
                  height: 22.w,
                  color: item.isCompleted
                      ? ColorsManager.Green
                      : ColorsManager.primaryColor,
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.titleKey.tr(),
                    style: context.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration:
                      item.isCompleted ? TextDecoration.lineThrough : null,
                      color: item.isCompleted
                          ? ColorsManager.darkGray
                          : ColorsManager.black,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    item.descKey.tr(),
                    style: context.bodySmall?.copyWith(
                      color: ColorsManager.darkGray,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 12.sp,
                        color: ColorsManager.darkGray300,
                      ),
                      horizontalSpace(4),
                      Text(
                        item.timeKey.tr(),
                        style: context.labelSmall?.copyWith(
                          color: ColorsManager.darkGray300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: ColorsManager.darkGray300,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTasks extends StatelessWidget {
  const _EmptyTasks();

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
              image: 'task',
              width: 48.w,
              height: 48.w,
              color: ColorsManager.darkGray300,
            ),
          ),
          verticalSpace(16),
          Text(
            'tasks.empty'.tr(),
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(8),
          Text(
            'tasks.empty_subtitle'.tr(),
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