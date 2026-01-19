// add_task_bottom_sheet.dart
import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _descController = TextEditingController();
  final _dateController = TextEditingController();
  final _fromTimeController = TextEditingController();
  final _toTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeDefaults();
  }

  void _initializeDefaults() {
    final now = DateTime.now();
    _dateController.text = DateFormat('dd/MM/yyyy').format(now);
    _fromTimeController.text = '09:30';
    _toTimeController.text = '11:30';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subjectController.dispose();
    _descController.dispose();
    _dateController.dispose();
    _fromTimeController.dispose();
    _toTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365 * 3)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsManager.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(result);
      });
    }
  }

  Future<void> _pickTime(TextEditingController controller) async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsManager.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      final formatted = MaterialLocalizations.of(context).formatTimeOfDay(
        result,
        alwaysUse24HourFormat: false,
      );
      setState(() {
        controller.text = formatted;
      });
    }
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context);
    }
  }

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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
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
                        const Spacer(),
                      ],
                    ),
                    verticalSpace(8),
                    Center(
                      child: Text(
                        'tasks.add_title'.tr(),
                        style: context.headlineSmall,
                      ),
                    ),
                    verticalSpace(24),
                    MyTextField(
                      controller: _titleController,
                      label: 'tasks.add_name_label'.tr(),
                      hintText: 'tasks.add_name_hint'.tr(),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'tasks.name_required'.tr();
                        }
                        return null;
                      },
                    ),
                    verticalSpace(16),
                    _SubjectField(controller: _subjectController),
                    verticalSpace(16),
                    MyTextField.multiline(
                      controller: _descController,
                      label: 'tasks.add_desc_label'.tr(),
                      hintText: 'tasks.add_desc_hint'.tr(),
                      maxLines: 3,
                      minLines: 3,
                    ),
                    verticalSpace(16),
                    _DateField(
                      controller: _dateController,
                      onTap: _pickDate,
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        Expanded(
                          child: _TimeField(
                            label: 'tasks.add_from'.tr(),
                            controller: _fromTimeController,
                            onTap: () => _pickTime(_fromTimeController),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: _TimeField(
                            label: 'tasks.add_to'.tr(),
                            controller: _toTimeController,
                            onTap: () => _pickTime(_toTimeController),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(32),
                    ElevatedButton(
                      onPressed: _onSave,
                      child: Text('tasks.add_button'.tr()),
                    ),
                    verticalSpace(16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubjectField extends StatelessWidget {
  final TextEditingController controller;

  const _SubjectField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'tasks.add_subject_label'.tr(),
          style: context.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorsManager.dark200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    controller.text.isEmpty
                        ? 'tasks.add_subject_hint'.tr()
                        : controller.text,
                    style: context.bodyMedium?.copyWith(
                      color: controller.text.isEmpty
                          ? ColorsManager.darkGray300
                          : ColorsManager.black,
                    ),
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
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const _DateField({
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'tasks.add_date_label'.tr(),
          style: context.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorsManager.dark200),
            ),
            child: Row(
              children: [
                MySvg(
                  image: 'calendar',
                  width: 18.w,
                  height: 18.w,
                  color: ColorsManager.darkGray,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    controller.text,
                    style: context.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onTap;

  const _TimeField({
    required this.label,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.labelMedium?.copyWith(
            color: ColorsManager.darkGray,
          ),
        ),
        verticalSpace(4),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorsManager.dark200),
            ),
            child: Row(
              children: [
                MySvg(
                  image: 'time',
                  width: 18.w,
                  height: 18.w,
                  color: ColorsManager.darkGray,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    controller.text,
                    style: context.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}