import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorsManager.dark200,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        labelColor: ColorsManager.primaryColor,
        unselectedLabelColor: ColorsManager.darkGray400,
        indicatorColor: ColorsManager.primaryColor,
        indicatorWeight: 2,
        tabs: [
          Tab(text: 'communities.details_posts'.tr()),
          Tab(text: 'communities.details_groups'.tr()),
        ],
      ),
    );
  }
}