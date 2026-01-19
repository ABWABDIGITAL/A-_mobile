import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:a_plus/feature/chats/ui/screens/chat_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';
import '../widgets/chat_filter_tabs.dart';
import '../widgets/chat_list_item.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedTab = 0;

  final List<ChatItemData> _chats = const [
    ChatItemData(
      nameKey: 'chats.chat1_name',
      lastMessageKey: 'chats.chat1_last',
      timeKey: 'chats.time_just_now',
      avatarAsset: 'assets/images/user.png',
      unreadCount: 0,
      isTyping: true,
      isOnline: true,
      isMuted: false,
      isGroup: false,
      isDeletedLast: false,
    ),
    ChatItemData(
      nameKey: 'chats.chat2_name',
      lastMessageKey: 'chats.chat2_last',
      timeKey: 'chats.time_2min',
      avatarAsset: 'assets/images/user.png',
      unreadCount: 2,
      isTyping: false,
      isOnline: true,
      isMuted: false,
      isGroup: false,
      isDeletedLast: false,
    ),
    ChatItemData(
      nameKey: 'chats.chat3_name',
      lastMessageKey: 'chats.chat3_last',
      timeKey: 'chats.time_1hour',
      avatarAsset: 'assets/images/communities.png',
      unreadCount: 19,
      isTyping: false,
      isOnline: true,
      isMuted: false,
      isGroup: true,
      isDeletedLast: false,
    ),
    ChatItemData(
      nameKey: 'chats.chat4_name',
      lastMessageKey: 'chats.chat4_last',
      timeKey: 'chats.time_just_now',
      avatarAsset: 'assets/images/user.png',
      unreadCount: 0,
      isTyping: false,
      isOnline: true,
      isMuted: false,
      isGroup: false,
      isDeletedLast: false,
    ),
    ChatItemData(
      nameKey: 'chats.chat5_name',
      lastMessageKey: 'chats.chat5_last',
      timeKey: 'chats.time_just_now',
      avatarAsset: 'assets/images/user.png',
      unreadCount: 0,
      isTyping: false,
      isOnline: false,
      isMuted: false,
      isGroup: false,
      isDeletedLast: true,
    ),
  ];

  List<ChatItemData> get _visibleChats {
    if (_selectedTab == 1) {
      return _chats.where((c) => c.unreadCount > 0).toList();
    } else if (_selectedTab == 2) {
      return _chats.where((c) => c.isGroup).toList();
    }
    return _chats;
  }

  int get _allCount => _chats.length;
  int get _unreadCount => _chats.where((c) => c.unreadCount > 0).length;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with consistent padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                child: const _ChatsHeader(),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ChatFilterTabs(
                  selectedIndex: _selectedTab,
                  allCount: _allCount,
                  unreadCount: _unreadCount,
                  onChanged: (i) {
                    setState(() {
                      _selectedTab = i;
                    });
                  },
                ),
              ),

              verticalSpace(16),
              Expanded(
                child: _visibleChats.isEmpty
                    ? _EmptyState(selectedTab: _selectedTab)
                    : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: _visibleChats.length,
                  itemBuilder: (context, index) {
                    final item = _visibleChats[index];
                    final isLast = index == _visibleChats.length - 1;

                    return Column(
                      children: [
                        _ChatListItemWrapper(
                          item: item,
                          onTap: () => _navigateToChat(item),
                        ),
                        if (!isLast)
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 68.w,
                            ),
                            child: Divider(
                              height: 1,
                              color: ColorsManager.grey200,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToChat(ChatItemData item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetailsScreen(
          chatName: item.nameKey.tr(),
          statusText: item.isOnline
              ? 'chats.status_online'.tr()
              : 'chats.status_offline'.tr(),
          avatarAsset: item.avatarAsset,
        ),
      ),
    );
  }
}

class ChatItemData {
  final String nameKey;
  final String lastMessageKey;
  final String timeKey;
  final String avatarAsset;
  final int unreadCount;
  final bool isTyping;
  final bool isOnline;
  final bool isMuted;
  final bool isGroup;
  final bool isDeletedLast;

  const ChatItemData({
    required this.nameKey,
    required this.lastMessageKey,
    required this.timeKey,
    required this.avatarAsset,
    required this.unreadCount,
    required this.isTyping,
    required this.isOnline,
    required this.isMuted,
    required this.isGroup,
    required this.isDeletedLast,
  });
}

class _ChatsHeader extends StatelessWidget {
  const _ChatsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PrimaryBackIcon(),
        Expanded(
          child: Text(
            'chats.title'.tr(),
            textAlign: TextAlign.center,
            style: context.headlineLarge,
          ),
        ),
        // Placeholder for balance
        SizedBox(width: 40.w),
      ],
    );
  }
}



class _ChatListItemWrapper extends StatelessWidget {
  final ChatItemData item;
  final VoidCallback onTap;

  const _ChatListItemWrapper({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: ChatListItem(
            item: item,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final int selectedTab;

  const _EmptyState({required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    String message;
    IconData icon;

    switch (selectedTab) {
      case 1:
        message = 'chats.empty_unread'.tr();
        icon = Icons.mark_email_read_rounded;
        break;
      case 2:
        message = 'chats.empty_groups'.tr();
        icon = Icons.group_rounded;
        break;
      default:
        message = 'chats.empty_all'.tr();
        icon = Icons.chat_bubble_outline_rounded;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: ColorsManager.grey100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 48.sp,
              color: ColorsManager.darkGray300,
            ),
          ),
          verticalSpace(16),
          Text(
            message,
            style: context.bodyMedium?.copyWith(
              color: ColorsManager.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}