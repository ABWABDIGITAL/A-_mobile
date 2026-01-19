import 'package:a_plus/core/widgets/primary/my_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class ScheduleSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const ScheduleSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField.search(
      controller: controller,
      hintText: 'schedule.search_hint'.tr(),
      fillColor: ColorsManager.white,
      prefixIcon: Padding(
        padding: EdgeInsets.all(15.r),
        child: MySvg(
          image: 'search',
          width: 5.w,
          height: 5.w,
        ),
      ),
      borderRadius: 12.r,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}