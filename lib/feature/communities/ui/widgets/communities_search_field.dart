import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class CommunitiesSearchField extends StatelessWidget {
  final TextEditingController controller;

  const CommunitiesSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField.search(
      controller: controller,
      hintText: 'communities.search_hint'.tr(),
      prefixIcon: Padding(
        padding: EdgeInsets.all(15.r),
        child: MySvg(
          image: 'search',
          width: 5.w,
          height: 5.w,
        ),
      ),
      // Customizations to match your original design
      borderRadius: 12.r,
      fillColor: Colors.white, // or your specific background color
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      onChanged: (value) {
        // Handle search logic here
      },
    );
  }
}