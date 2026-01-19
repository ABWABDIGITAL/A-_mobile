// message_bubble.dart
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../screens/chat_details_screen.dart';
import 'voice_message_content.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessageData data;
  final String avatarAsset;
  final bool showAvatar;

  const MessageBubble({
    super.key,
    required this.data,
    required this.avatarAsset,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: data.isMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!data.isMe) _buildAvatar(),
            if (!data.isMe && !showAvatar) SizedBox(width: 34.w),
            horizontalSpace(6),
            Flexible(
              child: _MessageContent(
                data: data,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (!showAvatar) return const SizedBox.shrink();

    return CircleAvatar(
      radius: 14.r,
      backgroundImage: AssetImage(avatarAsset),
    );
  }
}

class _MessageContent extends StatelessWidget {
  final ChatMessageData data;

  const _MessageContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      data.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: data.isMe ? ColorsManager.primary50 : ColorsManager.grey100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(data.isMe ? 16.r : 4.r),
              bottomRight: Radius.circular(data.isMe ? 4.r : 16.r),
            ),
          ),
          child: data.isVoice
              ? VoiceMessageContent(
            isMe: data.isMe,
            audioUrl:
            'https://www2.cs.uic.edu/~i101/SoundFiles/StarWars60.wav',
          )
              : Text(
            data.textKey.tr(),
            style: context.bodyMedium?.copyWith(
              color: ColorsManager.black,
            ),
          ),
        ),
        verticalSpace(4),
        _MessageTime(
          timeText: data.timeText,
          isMe: data.isMe,
          isRead: data.isRead,
        ),
      ],
    );
  }
}

class _MessageTime extends StatelessWidget {
  final String timeText;
  final bool isMe;
  final bool isRead;

  const _MessageTime({
    required this.timeText,
    required this.isMe,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          timeText,
          style: context.labelSmall?.copyWith(
            color: ColorsManager.darkGray300,
          ),
        ),
        if (isMe) ...[
          horizontalSpace(4),
          MySvg(
            image: isRead ? 'double_tick' : 'single_tick',
            width: 14.w,
            height: 14.w,
            color: isRead ? ColorsManager.primaryColor : ColorsManager.darkGray300,
          ),
        ],
      ],
    );
  }
}