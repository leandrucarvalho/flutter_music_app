import 'package:flutter_music_app/core/app/music_app_colors.dart';
import 'package:get/get.dart';

mixin SnackBarMixin {
  void showErrorSnackBar(String description) {
    Get.snackbar('Erro', description,
        colorText: MusicAppColors.secondaryColor,
        backgroundColor: MusicAppColors.errorColor);
  }
}
