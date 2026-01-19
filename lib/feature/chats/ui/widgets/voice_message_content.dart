// voice_message_content.dart
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';

class VoiceMessageContent extends StatefulWidget {
  final bool isMe;
  final String audioUrl;

  const VoiceMessageContent({
    super.key,
    required this.isMe,
    required this.audioUrl,
  });

  @override
  State<VoiceMessageContent> createState() => _VoiceMessageContentState();
}

class _VoiceMessageContentState extends State<VoiceMessageContent> {
  late PlayerController _controller;
  bool _isLoading = true;
  String _duration = '0:00';

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    _controller = PlayerController();
    _controller.addListener(_onPlayerStateChanged);

    try {
      await _controller.preparePlayer(
        path: widget.audioUrl,
        shouldExtractWaveform: true,
        noOfSamples: 50,
      );
      _updateDuration();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _onPlayerStateChanged() {
    if (mounted) setState(() {});
  }

  void _updateDuration() {
    final duration = _controller.maxDuration;
    final minutes = (duration / 60000).floor();
    final seconds = ((duration % 60000) / 1000).floor();
    _duration = '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _controller.removeListener(_onPlayerStateChanged);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _togglePlayPause() async {
    if (_controller.playerState == PlayerState.playing) {
      await _controller.pausePlayer();
    } else {
      await _controller.startPlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = _controller.playerState == PlayerState.playing;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PlayButton(
          isPlaying: isPlaying,
          isLoading: _isLoading,
          onTap: _togglePlayPause,
        ),
        horizontalSpace(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32.h,
                child: _isLoading
                    ? _LoadingWaveform()
                    : AudioFileWaveforms(
                  size: Size(double.infinity, 32.h),
                  playerController: _controller,
                  enableSeekGesture: true,
                  waveformType: WaveformType.long,
                  playerWaveStyle: PlayerWaveStyle(
                    fixedWaveColor: ColorsManager.grey200,
                    liveWaveColor: ColorsManager.primaryColor,
                    waveCap: StrokeCap.round,
                    waveThickness: 3,
                    spacing: 4,
                    showSeekLine: false,
                  ),
                ),
              ),
              verticalSpace(4),
              Text(
                _duration,
                style: context.labelSmall?.copyWith(
                  color: ColorsManager.darkGray300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final bool isPlaying;
  final bool isLoading;
  final VoidCallback onTap;

  const _PlayButton({
    required this.isPlaying,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: 44.w,
        height: 44.w,
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
        child: Center(
          child: isLoading
              ? SizedBox(
            width: 20.w,
            height: 20.w,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: ColorsManager.white,
            ),
          )
              : Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            size: 24.sp,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}

class _LoadingWaveform extends StatelessWidget {
  const _LoadingWaveform();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        20,
            (index) => Container(
          width: 3.w,
          height: (8 + (index % 5) * 4).h,
          decoration: BoxDecoration(
            color: ColorsManager.grey200,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ),
    );
  }
}