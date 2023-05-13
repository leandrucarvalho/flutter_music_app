// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/app/music_app_colors.dart';
import 'package:flutter_music_app/core/app/music_app_text_styles.dart';
import 'package:flutter_music_app/shared/widgets/image_widget.dart';
import 'package:flutter_music_app/shared/widgets/text_widget.dart';

class ImgAndTitleRowWidget extends StatelessWidget {
  final String? heroTag;
  final String? img;
  final String title;
  final Color? titleColor;

  const ImgAndTitleRowWidget({
    Key? key,
    this.heroTag,
    this.img,
    this.title = '',
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: heroTag ?? '',
          child: ImageWidget(
            img: img,
            width: 80,
            heigth: 80,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextWidget.normal(
            title,
            textStyle: MusicAppTextStyle.getNormalStyle.copyWith(
              color: titleColor ?? MusicAppColors.secondaryColor,
            ),
          ),
        )
      ],
    );
  }
}
