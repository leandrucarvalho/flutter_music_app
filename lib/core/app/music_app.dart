import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/app/music_app_initial_bindings.dart';
import 'package:flutter_music_app/core/app/music_app_material.dart';
import 'package:flutter_music_app/features/genre_list/presentation/screens/genre_list_screen.dart';
import 'package:get/get.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getThema,
      getPages: MusicAppMaterial.getPages,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindings(),
    );
  }
}
