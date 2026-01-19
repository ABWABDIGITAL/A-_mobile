import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';
import '../widgets/header_section.dart';
import '../widgets/posts_list.dart';
import '../widgets/tabs.dart';

class CommunityDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String membersText;
  final String coverImage;
  final String avatarImage;

  const CommunityDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.membersText,
    required this.coverImage,
    required this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PrimaryBackIcon(),
                      Expanded(
                        child: Text(
                          title,
                          style: context.headlineMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 32.w),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderSection(
                          title: title,
                          description: description,
                          membersText: membersText,
                          coverImage: coverImage,
                          avatarImage: avatarImage,
                        ),
                        verticalSpace(12),
                        const Tabs(),
                        SizedBox(
                          height: 400.h,
                          child: const TabBarView(
                            children: [
                              PostsList(),
                              _GroupsPlaceholder(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupsPlaceholder extends StatelessWidget {
  const _GroupsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'communities.details_groups_placeholder'.tr(),
        style: TextStyles.font14DarkGray400Weight,
      ),
    );
  }
}