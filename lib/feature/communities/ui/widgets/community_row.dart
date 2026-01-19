import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../screens/community_details_screen.dart';
import 'community_item_data.dart';

class CommunityRow extends StatelessWidget {
  final CommunityItemData item;

  const CommunityRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final followLabel = item.isFollowing
        ? 'communities.following'.tr()
        : 'communities.follow'.tr();

    final followBg = item.isFollowing
        ? ColorsManager.buttonGray
        : ColorsManager.primaryColor;

    final followTextColor = item.isFollowing
        ? ColorsManager.darkFontColor
        : ColorsManager.white;

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommunityDetailsScreen(
              title: item.titleKey.tr(),
              description: item.descKey.tr(),
              membersText: item.membersKey.tr(),
              coverImage: item.imageAsset,
              avatarImage: item.imageAsset,
            ),
          ),
        );
      },
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: ColorsManager.dark200),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  item.imageAsset,
                  width: 56.w,
                  height: 56.w,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.titleKey.tr(),
                      style: context.titleSmall,
                    ),
                    verticalSpace(4),
                    Text(
                      item.descKey.tr(),
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
                          item.membersKey.tr(),
                          style: context.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              horizontalSpace(8),
              Row(
                children: [
                  MyButton(
                    onPressed: () {},
                    height: 30.h,
                    minWidth: 72.w,
                    backgroundColor: followBg,
                    label: followLabel,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    labelStyle: TextStyles.font12White500Weight.copyWith(
                      color: followTextColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}