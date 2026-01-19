import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../screens/chats_screen.dart';

class ChatListItem extends StatelessWidget {
  final ChatItemData item;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Row(
          children: [
            // Avatar with online indicator
            _AvatarWithStatus(
              avatarAsset: item.avatarAsset,
              isOnline: item.isOnline,
              isGroup: item.isGroup,
            ),
            horizontalSpace(12),

            // Name and last message
            Expanded(
              child: _ChatContent(
                name: item.nameKey.tr(),
                lastMessage: _getLastMessageText(),
                isTyping: item.isTyping,
                isDeletedLast: item.isDeletedLast,
                isMuted: item.isMuted,
                hasUnread: item.unreadCount > 0,
              ),
            ),

            horizontalSpace(8),

            // Time and unread badge
            _TimeAndBadge(
              time: item.timeKey.tr(),
              unreadCount: item.unreadCount,
              isMuted: item.isMuted,
            ),
          ],
        ),
      ),
    );
  }

  String _getLastMessageText() {
    if (item.isTyping) {
      return 'chats.typing_now'.tr();
    } else if (item.isDeletedLast) {
      return 'chats.message_deleted'.tr();
    }
    return item.lastMessageKey.tr();
  }
}

// ═══════════════════════════════════════════════════════════
// AVATAR WITH STATUS INDICATOR
// ═══════════════════════════════════════════════════════════
class _AvatarWithStatus extends StatelessWidget {
  final String avatarAsset;
  final bool isOnline;
  final bool isGroup;

  const _AvatarWithStatus({
    required this.avatarAsset,
    required this.isOnline,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Avatar
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorsManager.grey200,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              avatarAsset,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: ColorsManager.grey100,
                  child: Icon(
                    isGroup ? Icons.group_rounded : Icons.person_rounded,
                    color: ColorsManager.darkGray300,
                    size: 28.sp,
                  ),
                );
              },
            ),
          ),
        ),

        // Online indicator (only for non-group chats)
        if (!isGroup && isOnline)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 14.w,
              height: 14.w,
              decoration: BoxDecoration(
                color: ColorsManager.success500,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 2,
                ),
              ),
            ),
          ),

        // Group indicator
        if (isGroup)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: ColorsManager.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.group_rounded,
                color: ColorsManager.white,
                size: 10.sp,
              ),
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CHAT CONTENT (NAME & MESSAGE)
// ═══════════════════════════════════════════════════════════
class _ChatContent extends StatelessWidget {
  final String name;
  final String lastMessage;
  final bool isTyping;
  final bool isDeletedLast;
  final bool isMuted;
  final bool hasUnread;

  const _ChatContent({
    required this.name,
    required this.lastMessage,
    required this.isTyping,
    required this.isDeletedLast,
    required this.isMuted,
    required this.hasUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Name row with mute icon
        Row(
          children: [
            Flexible(
              child: Text(
                name,
                style: context.titleMedium?.copyWith(
                  fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w500,
                  color: ColorsManager.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            if (isMuted) ...[
              horizontalSpace(6),
              Icon(
                Icons.volume_off_rounded,
                size: 16.sp,
                color: ColorsManager.darkGray300,
              ),
            ],
          ],
        ),

        verticalSpace(4),

        // Last message
        Row(
          children: [
            if (isDeletedLast) ...[
              Icon(
                Icons.block_rounded,
                size: 14.sp,
                color: ColorsManager.darkGray300,
              ),
              horizontalSpace(4),
            ],
            Expanded(
              child: isTyping
                  ? _TypingIndicator()
                  : Text(
                lastMessage,
                style: context.bodySmall?.copyWith(
                  color: isDeletedLast
                      ? ColorsManager.darkGray300
                      : hasUnread
                      ? ColorsManager.darkGray
                      : ColorsManager.darkGray300,
                  fontStyle:
                  isDeletedLast ? FontStyle.italic : FontStyle.normal,
                  fontWeight:
                  hasUnread ? FontWeight.w500 : FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TYPING INDICATOR
// ═══════════════════════════════════════════════════════════
class _TypingIndicator extends StatefulWidget {
  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'chats.typing_now'.tr(),
          style: context.bodySmall?.copyWith(
            color: ColorsManager.success500,
            fontWeight: FontWeight.w500,
          ),
        ),
        horizontalSpace(4),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                final delay = index * 0.2;
                final animValue =
                ((_controller.value + delay) % 1.0 * 2 - 1).abs();
                return Container(
                  margin: EdgeInsets.only(right: 2.w),
                  width: 4.w,
                  height: 4.w,
                  decoration: BoxDecoration(
                    color: ColorsManager.success500
                        .withOpacity(0.4 + (animValue * 0.6)),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TIME AND UNREAD BADGE
// ═══════════════════════════════════════════════════════════
class _TimeAndBadge extends StatelessWidget {
  final String time;
  final int unreadCount;
  final bool isMuted;

  const _TimeAndBadge({
    required this.time,
    required this.unreadCount,
    required this.isMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Time
        Text(
          time,
          style: context.labelSmall?.copyWith(
            color: unreadCount > 0
                ? ColorsManager.primaryColor
                : ColorsManager.darkGray300,
            fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.w400,
          ),
        ),

        verticalSpace(6),

        // Unread badge or placeholder
        if (unreadCount > 0)
          _UnreadBadge(
            count: unreadCount,
            isMuted: isMuted,
          )
        else
          SizedBox(height: 20.h),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// UNREAD BADGE
// ═══════════════════════════════════════════════════════════
class _UnreadBadge extends StatelessWidget {
  final int count;
  final bool isMuted;

  const _UnreadBadge({
    required this.count,
    required this.isMuted,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = count > 99 ? '99+' : count.toString();
    final isLargeNumber = count > 9;

    return Container(
      constraints: BoxConstraints(
        minWidth: 20.w,
        minHeight: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isLargeNumber ? 6.w : 0,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: isMuted ? ColorsManager.darkGray300 : ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: (isMuted
                ? ColorsManager.darkGray300
                : ColorsManager.primaryColor)
                .withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          displayCount,
          style: context.labelSmall?.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}