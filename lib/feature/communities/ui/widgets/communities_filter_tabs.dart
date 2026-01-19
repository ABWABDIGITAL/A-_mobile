import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class CommunitiesFilterTabs extends StatelessWidget {
  final bool showAll;
  final ValueChanged<bool> onChanged;

  const CommunitiesFilterTabs({
    required this.showAll,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: ColorsManager.dark50,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onChanged(true),
              child: Container(
                decoration: BoxDecoration(
                  color: showAll ? ColorsManager.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'communities.filter_all'.tr(),
                  style: showAll
                      ? TextStyles.font12White500Weight
                      : TextStyles.font12DarkGray400Weight,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChanged(false),
              child: Container(
                decoration: BoxDecoration(
                  color: !showAll ?ColorsManager.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'communities.filter_following'.tr(),
                  style: !showAll
                      ? TextStyles.font12White500Weight
                      : TextStyles.font12DarkGray400Weight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}