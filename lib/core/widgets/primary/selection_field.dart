import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils/spacing.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class SelectionField extends StatelessWidget {
  final String hint;
  final String? value;
  final VoidCallback onTap;

  const SelectionField({
    super.key,
    required this.hint,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorsManager.dark200),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hasValue ? value! : hint,
                style: hasValue
                    ? TextStyles.font14Black400Weight
                    : TextStyles.font14Dark300400Weight,
                textAlign: TextAlign.right,
              ),
            ),
            horizontalSpace(8),
            Icon(
              Icons.chevron_left,
              color: ColorsManager.darkGray300,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}