import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class AddAppointmentBottomSheet extends StatefulWidget {
  const AddAppointmentBottomSheet({super.key});

  @override
  State<AddAppointmentBottomSheet> createState() =>
      _AddAppointmentBottomSheetState();
}

class _AddAppointmentBottomSheetState extends State<AddAppointmentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
    _fromTimeController.text = '9:30 صباحاً';
    _toTimeController.text = '11:30 صباحاً';
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                    // Header
                    _BottomSheetHeader(
                      onClose: () => Navigator.pop(context),
                    ),
                    verticalSpace(24),

                    // Name Field
                    _LabeledTextField(
                      label: 'schedule.add_name_label'.tr(),
                      hint: 'schedule.add_name_hint'.tr(),
                      controller: _nameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'schedule.name_required'.tr();
                        }
                        return null;
                      },
                    ),
                    verticalSpace(16),

                    // Description Field
                    _LabeledTextField(
                      label: 'schedule.add_desc_label'.tr(),
                      hint: 'schedule.add_desc_hint'.tr(),
                      controller: _descController,
                      maxLines: 3,
                    ),
                    verticalSpace(16),

                    // Date Field
                    _LabeledTextField(
                      label: 'schedule.add_date_label'.tr(),
                      hint: 'schedule.add_date_hint'.tr(),
                      controller: _dateController,
                      readOnly: true,
                      onTap: _pickDate,
                      suffixIcon: MySvg(
                        image: 'calendar',
                        width: 20.w,
                        height: 20.w,
                        color: ColorsManager.darkGray,
                      ),
                    ),
                    verticalSpace(16),

                    // Time Fields Row
                    Row(
                      children: [
                        Expanded(
                          child: _LabeledTextField(
                            label: 'schedule.add_from'.tr(),
                            controller: _fromTimeController,
                            readOnly: true,
                            onTap: () => _pickTime(_fromTimeController),
                            suffixIcon: MySvg(
                              image: 'time',
                              width: 20.w,
                              height: 20.w,
                              color: ColorsManager.darkGray,
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: _LabeledTextField(
                            label: 'schedule.add_to'.tr(),
                            controller: _toTimeController,
                            readOnly: true,
                            onTap: () => _pickTime(_toTimeController),
                            suffixIcon: MySvg(
                              image: 'time',
                              width: 20.w,
                              height: 20.w,
                              color: ColorsManager.darkGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(32),

                    // Save Button
                    MyButton(
                      onPressed: _onSave,
                      label: 'schedule.add_save'.tr(),
                    ),
                    verticalSpace(24),
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

// ═══════════════════════════════════════════════════════════
// BOTTOM SHEET HEADER
// ═══════════════════════════════════════════════════════════
class _BottomSheetHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _BottomSheetHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'schedule.add_title'.tr(),
          style: context.headlineSmall,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onClose,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
            ),
            child: Icon(
              Icons.close_rounded,
              size: 20.sp,
              color: ColorsManager.darkGray,
            ),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// LABELED TEXT FIELD
// ═══════════════════════════════════════════════════════════
class _LabeledTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const _LabeledTextField({
    required this.label,
    this.hint,
    required this.controller,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.validator,
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
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          style: context.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon != null
                ? Padding(
              padding: EdgeInsets.all(12.r),
              child: suffixIcon,
            )
                : null,
          ),
        ),
      ],
    );
  }
}