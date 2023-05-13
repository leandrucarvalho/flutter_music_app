// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/extensions/media_query_extension.dart';
import 'package:flutter_music_app/shared/widgets/image_widget.dart';
import 'package:flutter_music_app/shared/widgets/text_widget.dart';

import '../../../../shared/models/genre_model.dart';

class GenreDetailsAppBarWidget extends StatelessWidget {
  final GenreModel genre;

  const GenreDetailsAppBarWidget({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.getWidth / 1.5,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(
          bottom: context.getWidth / 3 - 12,
        ),
        title: TextWidget.title(genre.title),
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Hero(
          tag: genre.title,
          child: ImageWidget(
            width: context.getWidth,
            heigth: context.getWidth / 1.5,
            img: genre.img,
          ),
        ),
      ),
    );
  }
}
