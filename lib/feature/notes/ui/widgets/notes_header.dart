import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';

class NotesHeader extends StatelessWidget {
  const NotesHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PrimaryBackIcon(),
        const Spacer(),
        Text(
          'notes.title'.tr(),
          style: context.headlineSmall,
        ),
        const Spacer(),
        SizedBox(width: 32.w),
      ],
    );
  }
}

// class _NotesSectionHeader extends StatelessWidget {
//   const _NotesSectionHeader();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: ColorsManager.dark50,
//       padding: EdgeInsets.symmetric(vertical: 10.h),
//       child: Align(
//         alignment: AlignmentDirectional.centerStart,
//         child: Text(
//           'notes.section_title'.tr(),
//           style: TextStyles.font14Dark500Weight,
//         ),
//       ),
//     );
//   }
// }