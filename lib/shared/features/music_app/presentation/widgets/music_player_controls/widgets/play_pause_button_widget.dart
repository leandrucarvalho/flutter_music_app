// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/app/music_app_colors.dart';
import 'package:flutter_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:get/get.dart';

enum PlayPauseButtonSize { small, normal }

class PlayPauseButtonWidget extends StatelessWidget {
  final String? musicUrl;
  final PlayPauseButtonSize _playPauseButtonSize;

  const PlayPauseButtonWidget({
    this.musicUrl,
    PlayPauseButtonSize? playPauseButtonSize,
    super.key,
  }) : _playPauseButtonSize = playPauseButtonSize ?? PlayPauseButtonSize.normal;

  @override
  Widget build(BuildContext context) {
    final musicPlayerCtrl = Get.find<MusicPlayerController>();

    return Obx(
      () => IconButton(
        iconSize: _playPauseButtonSize == PlayPauseButtonSize.normal ? 70 : 50,
        onPressed: () async {
          if (musicUrl != null) {
            if (musicPlayerCtrl.isPlaying.value) {
              musicPlayerCtrl.pauseMusic();
            } else {
              musicPlayerCtrl.playMusic(musicUrl!);
            }
          }
        },
        icon: Icon(
          musicPlayerCtrl.isPlaying.value
              ? Icons.pause_circle
              : Icons.play_circle,
          color: MusicAppColors.secondaryColor,
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}
