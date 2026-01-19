import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      _PostData(
        author: 'communities.details_post1_author'.tr(),
        time: 'communities.details_post1_time'.tr(),
        content: 'communities.details_post1_content'.tr(),
        avatar: 'assets/images/user.png',
      ),
      _PostData(
        author: 'communities.details_post2_author'.tr(),
        time: 'communities.details_post2_time'.tr(),
        content: 'communities.details_post2_content'.tr(),
        avatar: 'assets/images/user.png',
      ),
      _PostData(
        author: 'communities.details_post3_author'.tr(),
        time: 'communities.details_post3_time'.tr(),
        content: 'communities.details_post3_content'.tr(),
        avatar: 'assets/images/user.png',
      ),
    ];

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        final p = posts[index];
        return _PostItem(data: p);
      },
    );
  }
}

class _PostItem extends StatelessWidget {
  final _PostData data;

  const _PostItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.dark200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage: AssetImage(data.avatar),
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.author,
                      style: context.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.time,
                      style: context.labelSmall,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 20.sp,
                color: ColorsManager.darkGray300,
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            data.content,
            style: context.bodySmall,
          ),
          verticalSpace(10),
          Row(
            children: [
              MySvg(
                image: 'heart',
                width: 16.w,
                height: 16.w,
                color: ColorsManager.darkGray300,
              ),
              horizontalSpace(4),
              Text(
                '16',
                style:context.labelSmall,
              ),
              horizontalSpace(16),
              MySvg(
                image: 'comment',
                width: 16.w,
                height: 16.w,
                color: ColorsManager.darkGray300,
              ),
              horizontalSpace(4),
              Text(
                '10 تعليق',
                style: context.labelSmall,
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class _PostData {
  final String author;
  final String time;
  final String content;
  final String avatar;

  _PostData({
    required this.author,
    required this.time,
    required this.content,
    required this.avatar,
  });
}