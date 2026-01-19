// feature/communities/ui/screens/communities_screen.dart
import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/notification_bell_with_badge.dart';
import '../widgets/communities_filter_tabs.dart';
import '../widgets/communities_search_field.dart';
import '../widgets/community_item_data.dart';
import '../widgets/community_row.dart';
import '../widgets/create_community_bottom_sheet.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  bool showAll = true;
  final TextEditingController _searchController = TextEditingController();
  void _showCreateCommunitySheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CreateCommunityBottomSheet(),
    );
  }
  final List<CommunityItemData> _items = const [
    CommunityItemData(
      titleKey: 'communities.item_cs_title',
      descKey: 'communities.item_cs_desc',
      membersKey: 'communities.item_cs_members',
      imageAsset: 'assets/images/communities.png',
      isFollowing: false,
    ),
    CommunityItemData(
      titleKey: 'communities.item_eng_title',
      descKey: 'communities.item_eng_desc',
      membersKey: 'communities.item_eng_members',
      imageAsset: 'assets/images/communities.png',
      isFollowing: true,
    ),
    CommunityItemData(
      titleKey: 'communities.item_arts_title',
      descKey: 'communities.item_arts_desc',
      membersKey: 'communities.item_arts_members',
      imageAsset: 'assets/images/communities.png',
      isFollowing: true,
    ),
    CommunityItemData(
      titleKey: 'communities.item_business_title',
      descKey: 'communities.item_business_desc',
      membersKey: 'communities.item_business_members',
      imageAsset: 'assets/images/communities.png',
      isFollowing: false,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    final visibleItems = showAll
        ? _items
        : _items.where((e) => e.isFollowing).toList();

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppLogoHeader(),
                    NotificationBellWithBadge(count: 5),
                  ],
                ),
                verticalSpace(24),
                Text(
                  'communities.title'.tr(),
                  style: context.headlineLarge,
                ),
                verticalSpace(16),
                CommunitiesSearchField(controller: _searchController),
                verticalSpace(12),
                CommunitiesFilterTabs(
                  showAll: showAll,
                  onChanged: (all) {
                    setState(() {
                      showAll = all;
                    });
                  },
                ),
                verticalSpace(16),
                Expanded(
                  child: ListView.separated(
                    itemCount: visibleItems.length,
                    separatorBuilder: (_, __) => SizedBox(height: 8.h),
                    itemBuilder: (context, index) {
                      final item = visibleItems[index];
                      return CommunityRow(item: item);
                    },
                  ),
                ),
                verticalSpace(8),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                    onTap: _showCreateCommunitySheet,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







