import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final String description;
  final String membersText;
  final String coverImage;
  final String avatarImage;

  const HeaderSection({
    super.key,
    required this.title,
    required this.description,
    required this.membersText,
    required this.coverImage,
    required this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 160.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    coverImage,
                    width: double.infinity,
                    height: 160.h,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  bottom: -28.r,
                  start: 16.w,
                  child: Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: const BoxDecoration(
                      color: ColorsManager.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundImage: AssetImage(avatarImage),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'communities.details_major_title'.tr(),
                  style: context.titleLarge,
                ),
                verticalSpace(4),
                Text(
                  description,
                  style: context.bodySmall,
                ),
                verticalSpace(4),
                Row(
                  children: [
                    MySvg(
                      image: 'users',
                      width: 14.w,
                      height: 14.w,
                      color: ColorsManager.darkGray300,
                    ),
                    horizontalSpace(4),
                    Text(
                      membersText,
                      style: context.bodySmall,
                    ),
                  ],
                ),
                verticalSpace(12),
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                        onPressed: () {},
                        height: 36.h,
                        radius: 8.r,
                        backgroundColor: ColorsManager.primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        label: 'communities.details_follow'.tr(),
                        labelStyle: context.bodySmall?.copyWith(color: ColorsManager.white),
                        expand: false,
                      ),
                    ),
                    horizontalSpace(8),
                    Expanded(
                      child: MyButton(
                        onPressed: () {},
                        height: 36.h,
                        radius: 8.r,
                        backgroundColor: ColorsManager.white,
                        borderColor: ColorsManager.dark200,
                        stroke: 1,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        prefixIcon: MySvg(
                          image: 'share',
                          width: 16.w,
                          height: 16.w,
                        ),
                        label: 'communities.details_share'.tr(),
                        labelStyle: context.bodySmall,
                        expand: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}