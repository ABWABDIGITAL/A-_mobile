import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class NotesSearchField extends StatelessWidget {
  final TextEditingController controller;

  const NotesSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField.search(
      controller: controller,
        fillColor: ColorsManager.white,
        hintText: 'notes.search_hint'.tr(),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.r),
          child: MySvg(
            image: 'search',
            width: 15.w,
            height: 15.w,
        ),

      ),
    );
  }
}