import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class NotesSectionHeader extends StatelessWidget {
  const NotesSectionHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.h),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'notes.section_title'.tr(),
          style: context.titleMedium,
        ),
      ),
    );
  }
}