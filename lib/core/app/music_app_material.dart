import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/app/music_app_colors.dart';
import 'package:flutter_music_app/features/genre_details/presentation/bindings/genre_details_bindings.dart';
import 'package:flutter_music_app/features/genre_list/presentation/screens/genre_list_screen.dart';
import 'package:get/get.dart';

import '../../features/genre_details/presentation/screens/genre_details_screen.dart';
import '../../features/genre_list/presentation/bindings/genre_list_bindings.dart';

class MusicAppMaterial {
  MusicAppMaterial._();

  static String get getTitle => "Music App - Flutter Dicas";

  // Rotas do aplicativo
  static List<GetPage> get getPages => [
        GetPage(
          name: GenreListScreen.routeName,
          page: () => const GenreListScreen(),
          binding: GenreListBindings(),
          children: [
            GetPage(
              name: GenreDetailsScreen.routeName,
              page: () => const GenreDetailsScreen(),
              binding: GenreDetailsBindins(),
            ),
          ],
        )
      ];

  static ThemeData get getThema => ThemeData(
        primaryColor: MusicAppColors.primaryColor,
        appBarTheme: AppBarTheme(
            backgroundColor: MusicAppColors.primaryColor,
            titleTextStyle: TextStyle(
              color: MusicAppColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            centerTitle: true,
            elevation: 0),
        fontFamily: 'Nunito',
      );
}
