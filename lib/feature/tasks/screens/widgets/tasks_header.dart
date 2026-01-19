import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';

class TasksHeader extends StatelessWidget {
  const TasksHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PrimaryBackIcon(),
        const Spacer(),
        Text(
          'tasks.title'.tr(),
          style: TextStyles.font16Black500Weight,
        ),
        const Spacer(),
        SizedBox(width: 32.w),
      ],
    );
  }
}
