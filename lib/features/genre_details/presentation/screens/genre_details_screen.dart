import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/app/music_app_colors.dart';
import 'package:flutter_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:flutter_music_app/shared/features/music_app/presentation/widgets/mini_music_player_widget.dart';
import 'package:flutter_music_app/shared/models/genre_model.dart';
import 'package:get/get.dart';

import '../widgets/genre_details_app_bar_widgets.dart';
import '../widgets/genre_details_music_list_widget.dart';

class GenreDetailsScreen extends StatelessWidget {
  static const routeName = "/genre-details";
  const GenreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    final genre = Get.arguments as GenreModel;

    return Scaffold(
      backgroundColor: MusicAppColors.primaryColor,
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  GenreDetailsAppBarWidget(
                    genre: genre,
                  ),
                  GenreDetailsMusicListWidget(
                    genreSearchString: genre.searchString,
                  ),
                ],
              ),
            ),
            if (musicPlayerController.getPlaylistPlaying.isNotEmpty)
              const MiniMusicPlayerWidget()
          ],
        ),
      ),
    );
  }
}
