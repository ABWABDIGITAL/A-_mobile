import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class TasksSearchField extends StatelessWidget {
  final TextEditingController controller;

  const TasksSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.font14Black400Weight,
      decoration: InputDecoration(
        hintText: 'tasks.search_hint'.tr(),
        hintStyle: TextStyles.font14Dark300400Weight,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.r),
          child: MySvg(
            image: 'search',
            width: 10.w,
            height: 10.w,
            color: ColorsManager.darkGray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.dark200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.dark200),
        ),
      ),
    );
  }
}