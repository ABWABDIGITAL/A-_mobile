import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class TaskDetailsBottomSheet extends StatelessWidget {
  final String title;
  final String subject;
  final String description;
  final String dateText;
  final String fromTimeText;
  final String toTimeText;
  final bool isCompleted;

  const TaskDetailsBottomSheet({
    super.key,
    required this.title,
    required this.subject,
    required this.description,
    required this.dateText,
    required this.fromTimeText,
    required this.toTimeText,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'tasks.details_title'.tr(),
                        style: context.headlineSmall,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          child: Icon(
                            Icons.close_rounded,
                            size: 20.sp,
                            color: ColorsManager.darkGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  _DetailField(
                    label: 'tasks.add_name_label'.tr(),
                    value: title,
                  ),
                  verticalSpace(16),
                  _DetailField(
                    label: 'tasks.add_subject_label'.tr(),
                    value: subject,
                    suffixIcon: Icons.arrow_forward_ios,
                  ),
                  verticalSpace(16),
                  _DetailField(
                    label: 'tasks.add_desc_label'.tr(),
                    value: description,
                    maxLines: 3,
                  ),
                  verticalSpace(16),
                  _DetailField(
                    label: 'tasks.add_date_label'.tr(),
                    value: dateText,
                    prefixIconName: 'calendar',
                  ),
                  verticalSpace(16),
                  Row(
                    children: [
                      Expanded(
                        child: _DetailField(
                          label: 'tasks.add_from'.tr(),
                          value: fromTimeText,
                          prefixIconName: 'time',
                        ),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: _DetailField(
                          label: 'tasks.add_to'.tr(),
                          value: toTimeText,
                          prefixIconName: 'time',
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(32),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: Text(
                        'tasks.details_delete'.tr(),
                        style: context.titleSmall?.copyWith(
                          color: ColorsManager.errorColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      isCompleted
                          ? 'tasks.details_reopen'.tr()
                          : 'tasks.details_complete'.tr(),
                    ),
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailField extends StatelessWidget {
  final String label;
  final String value;
  final int maxLines;
  final String? prefixIconName;
  final IconData? suffixIcon;

  const _DetailField({
    required this.label,
    required this.value,
    this.maxLines = 1,
    this.prefixIconName,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: ColorsManager.grey100,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: ColorsManager.grey200),
          ),
          child: Row(
            children: [
              if (prefixIconName != null) ...[
                MySvg(
                  image: prefixIconName!,
                  width: 18.w,
                  height: 18.w,
                  color: ColorsManager.darkGray,
                ),
                horizontalSpace(8),
              ],
              Expanded(
                child: Text(
                  value,
                  style: context.bodyMedium,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (suffixIcon != null)
                Icon(
                  suffixIcon,
                  size: 16.sp,
                  color: ColorsManager.darkGray300,
                ),
            ],
          ),
        ),
      ],
    );
  }
}