// chat_details_screen.dart
import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/message_bubble.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String chatName;
  final String statusText;
  final String avatarAsset;

  const ChatDetailsScreen({
    super.key,
    required this.chatName,
    required this.statusText,
    required this.avatarAsset,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessageData> _messages = [
    ChatMessageData(
      textKey: 'chats.msg1',
      timeText: '09:25 AM',
      isMe: true,
    ),
    ChatMessageData(
      textKey: 'chats.msg2',
      timeText: '09:25 AM',
      isMe: false,
    ),
    ChatMessageData(
      textKey: 'chats.msg3',
      timeText: '09:25 AM',
      isMe: false,
    ),
    ChatMessageData(
      textKey: 'chats.msg4',
      timeText: '09:25 AM',
      isMe: false,
    ),
    ChatMessageData(
      textKey: 'chats.msg5',
      timeText: '09:25 AM',
      isMe: true,
    ),
    ChatMessageData(
      textKey: 'chats.msg6',
      timeText: '09:25 AM',
      isMe: false,
      isVoice: true,
    ),
    ChatMessageData(
      textKey: 'chats.msg7',
      timeText: '09:25 AM',
      isMe: true,
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _ChatHeader(
                chatName: widget.chatName,
                statusText: widget.statusText,
                avatarAsset: widget.avatarAsset,
                isOnline: widget.statusText == 'chats.status_online'.tr(),
              ),
              Divider(height: 1, color: ColorsManager.grey200),
              Expanded(
                child: _MessagesList(
                  messages: _messages,
                  avatarAsset: widget.avatarAsset,
                  scrollController: _scrollController,
                ),
              ),
              ChatInputBar(
                onSend: (message) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessageData {
  final String textKey;
  final String timeText;
  final bool isMe;
  final bool isVoice;
  final bool isRead;

  ChatMessageData({
    required this.textKey,
    required this.timeText,
    required this.isMe,
    this.isVoice = false,
    this.isRead = true,
  });
}

class _ChatHeader extends StatelessWidget {
  final String chatName;
  final String statusText;
  final String avatarAsset;
  final bool isOnline;

  const _ChatHeader({
    required this.chatName,
    required this.statusText,
    required this.avatarAsset,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          _BackButton(),
          horizontalSpace(8),
          _UserAvatar(
            avatarAsset: avatarAsset,
            isOnline: isOnline,
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatName,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(2),
                Row(
                  children: [
                    if (isOnline)
                      Container(
                        width: 8.w,
                        height: 8.w,
                        margin: EdgeInsetsDirectional.only(end: 4.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.Green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Text(
                      statusText,
                      style: context.labelSmall?.copyWith(
                        color: isOnline
                            ? ColorsManager.Green
                            : ColorsManager.darkGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _HeaderActions(),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: RotatedBox(
          quarterTurns: context.locale == const Locale('ar') ? 0 : 2,
          child: Icon(Icons.arrow_back_ios
            ,size:16 ,
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String avatarAsset;
  final bool isOnline;

  const _UserAvatar({
    required this.avatarAsset,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: AssetImage(avatarAsset),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: ColorsManager.Green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _HeaderActions extends StatelessWidget {
  const _HeaderActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(4),
        _ActionButton(
          icon: Icons.more_vert,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Icon(
          icon,
          size: 22.sp,
          color: ColorsManager.darkGray,
        ),
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  final List<ChatMessageData> messages;
  final String avatarAsset;
  final ScrollController scrollController;

  const _MessagesList({
    required this.messages,
    required this.avatarAsset,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final showAvatar = !message.isMe &&
            (index == messages.length - 1 ||
                messages[index + 1].isMe);

        return MessageBubble(
          data: message,
          avatarAsset: avatarAsset,
          showAvatar: showAvatar,
        );
      },
    );
  }
}