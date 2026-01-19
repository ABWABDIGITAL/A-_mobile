import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class TasksFloatingAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TasksFloatingAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: MySvg(
              image: 'plus',
              width: 24.w,
              height: 24.w,
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
