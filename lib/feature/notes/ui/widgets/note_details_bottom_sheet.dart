import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class NoteDetailsBottomSheet extends StatefulWidget {
  final String title;
  final String description;
  final String timeText;

  const NoteDetailsBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.timeText,
  });

  @override
  State<NoteDetailsBottomSheet> createState() =>
      _NoteDetailsBottomSheetState();
}

class _NoteDetailsBottomSheetState extends State<NoteDetailsBottomSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onDelete() {
    // TODO: تنفيذ حذف الملاحظة
    Navigator.pop(context);
  }

  void _onSave() {
    // TODO: حفظ التعديلات على الملاحظة
    Navigator.pop(context);
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'notes.details_title'.tr(),
                        style: TextStyles.font18Black500Weight,
                        textAlign: TextAlign.center,
                      ), const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                        color: ColorsManager.darkGray,
                      ),

                    ],
                  ),

                  verticalSpace(24),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'notes.add_title_label'.tr(),
                      style: TextStyles.font14Dark500Weight,
                    ),
                  ),
                  verticalSpace(8),
                  TextField(
                    controller: _titleController,
                    style: TextStyles.font14Black400Weight,
                    decoration: InputDecoration(
                      hintText: 'notes.add_title_hint'.tr(),
                      hintStyle: TextStyles.font14Dark300400Weight,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                        BorderSide(color: ColorsManager.primaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                    ),
                  ),
                  verticalSpace(16),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'notes.add_desc_label'.tr(),
                      style: TextStyles.font14Dark500Weight,
                    ),
                  ),
                  verticalSpace(8),
                  TextField(
                    controller: _descController,
                    maxLines: 5,
                    style: TextStyles.font14Black400Weight,
                    decoration: InputDecoration(
                      hintText: 'notes.add_desc_hint'.tr(),
                      hintStyle: TextStyles.font14Dark300400Weight,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                        BorderSide(color: ColorsManager.primaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                    ),
                  ),
                  verticalSpace(24),


                  Align(
                    alignment: AlignmentDirectional.center,
                    child: InkWell(
                      onTap: _onDelete,
                      child: Text(
                        'notes.details_delete'.tr(),
                        style: TextStyles.font14Red500Weight.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  verticalSpace(16),

                  // حفظ / إغلاق
                  MyButton(
                    onPressed: _onSave,
                    height: 48.h,
                    radius: 8.r,
                    backgroundColor: ColorsManager.primaryColor,
                    label: 'notes.details_save'.tr(),
                    labelStyle: TextStyles.font14White500Weight,
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