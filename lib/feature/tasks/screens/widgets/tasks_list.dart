import 'package:a_plus/feature/tasks/screens/widgets/task_details_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../ui/tasks_screen.dart';

class TasksList extends StatelessWidget {
  final List<TaskItemData> tasks;

  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'tasks.empty'.tr(),
          style: TextStyles.font14DarkGray400Weight,
        ),
      );
    }

    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        final item = tasks[index];
        return TaskRow(
          item: item,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => TaskDetailsBottomSheet(
                title: item.titleKey.tr(),
                subject: 'tasks.details_subject_example'.tr(),
                description: 'tasks.details_desc_example'.tr(),
                dateText: '12/10/2025',
                fromTimeText: '09:30',
                toTimeText: '11:30',
              ),
            );
          },
        );
      },
    );
  }
}

class TaskRow extends StatelessWidget {
  final TaskItemData item;
  final VoidCallback? onTap;

  const TaskRow({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorsManager.dark50),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: ColorsManager.lightGreen,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: MySvg(
                  image: 'check-done',
                  width: 20.w,
                  height: 20.w,
                  color: ColorsManager.Green,
                ),
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.titleKey.tr(),
                    style: TextStyles.font14Primary500Weight,
                  ),
                  verticalSpace(4),
                  Text(
                    item.descKey.tr(),
                    style: TextStyles.font12DarkGray400Weight,
                  ),
                  verticalSpace(4),
                  Text(
                    item.timeKey.tr(),
                    style: TextStyles.font10Dark400Grey400Weight,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
