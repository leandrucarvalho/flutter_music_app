import 'package:flutter_music_app/core/services/api_service.dart';
import 'package:flutter_music_app/features/genre_details/data/repositories/genre_details_repository.dart';
import 'package:flutter_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:get/get.dart';

import '../controllers/genre_details_controller.dart';

class GenreDetailsBindins extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreDetailsController(
        GenreDetailsRepository(
          apiService: Get.find<ApiService>(),
        ),
        Get.find<MusicPlayerController>(),
      ),
    );
  }
}
