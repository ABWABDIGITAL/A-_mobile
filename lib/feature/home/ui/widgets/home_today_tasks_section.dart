import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

import '../../../../core/widgets/primary/my_svg.dart';

class HomeTodayTasksSection extends StatelessWidget {
  const HomeTodayTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      _HomeTaskData(
        titleKey: 'home.task1_title',
        descKey: 'home.task1_desc',
        timeKey: 'home.task1_time',
      ),
      _HomeTaskData(
        titleKey: 'home.task2_title',
        descKey: 'home.task2_desc',
        timeKey: 'home.task2_time',
      ),
      _HomeTaskData(
        titleKey: 'home.task3_title',
        descKey: 'home.task3_desc',
        timeKey: 'home.task3_time',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'home.today_tasks'.tr(),
              style:context.titleLarge,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'home.view_all'.tr(),
                style: context.titleSmall?.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        ...tasks
            .map((t) => Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: _HomeTaskItem(data: t),
        ))
            .toList(),
      ],
    );
  }
}

class _HomeTaskData {
  final String titleKey;
  final String descKey;
  final String timeKey;

  _HomeTaskData({
    required this.titleKey,
    required this.descKey,
    required this.timeKey,
  });
}

class _HomeTaskItem extends StatelessWidget {
  final _HomeTaskData data;

  const _HomeTaskItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.dark200),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF22D08B).withOpacity(.10),
            ),
            child: Center(
              child: MySvg(
                image: 'check-done',
                width: 18.w,
                height: 18.w,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.titleKey.tr(),
                  style: context.titleMedium?.copyWith(color: ColorsManager.primaryColor),
                ),
                verticalSpace(4),
                Text(
                  data.descKey.tr(),
                  style: context.bodySmall,
                ),
                verticalSpace(4),
                Text(
                  data.timeKey.tr(),
                  style: context.bodySmall,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

