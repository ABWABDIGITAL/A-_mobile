// chat_input_bar.dart
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class ChatInputBar extends StatefulWidget {
  final Function(String)? onSend;
  final VoidCallback? onAttachment;
  final VoidCallback? onVoiceRecord;

  const ChatInputBar({
    super.key,
    this.onSend,
    this.onAttachment,
    this.onVoiceRecord,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = _controller.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend?.call(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          top: BorderSide(color: ColorsManager.grey200),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // _AttachmentButton(onTap: widget.onAttachment),
            horizontalSpace(8),
            Expanded(
              child: _InputField(
                controller: _controller,
                onSubmitted: (_) => _handleSend(),
              ),
            ),
            horizontalSpace(8),
            _SendButton(
              hasText: _hasText,
              onSend: _handleSend,
              onVoiceRecord: widget.onVoiceRecord,
            ),
          ],
        ),
      ),
    );
  }
}

// class _AttachmentButton extends StatelessWidget {
//   final VoidCallback? onTap;
//
//   const _AttachmentButton({this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10.w),
//         decoration: BoxDecoration(
//           color: ColorsManager.grey100,
//           shape: BoxShape.circle,
//         ),
//         child: MySvg(
//           image: 'attachment',
//           width: 20.w,
//           height: 20.w,
//           color: ColorsManager.darkGray,
//         ),
//       ),
//     );
//   }
// }

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  const _InputField({
    required this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyTextField(
        controller: controller,
        textInputAction: TextInputAction.send,
        onSubmitted: onSubmitted,
          borderRadius: 25.r ,
          hintText: 'chats.input_hint'.tr(),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MySvg(
                image: 'emoji',
                width: 8.w,
                height: 8.w,
                color: ColorsManager.darkGray300,
              ),
            ),
          ),
        ),

    );
  }
}

class _SendButton extends StatelessWidget {
  final bool hasText;
  final VoidCallback onSend;
  final VoidCallback? onVoiceRecord;

  const _SendButton({
    required this.hasText,
    required this.onSend,
    this.onVoiceRecord,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasText ? onSend : onVoiceRecord,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: hasText
              ? Icon(
            Icons.send_rounded,
            key: const ValueKey('send'),
            size: 20.sp,
            color: ColorsManager.white,
          )
              : MySvg(
            key: const ValueKey('mic'),
            image: 'Microphone',
            width: 20.w,
            height: 20.w,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}