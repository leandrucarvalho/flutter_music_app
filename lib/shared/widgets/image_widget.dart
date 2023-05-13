// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? img;
  final double width;
  final double heigth;

  const ImageWidget({
    Key? key,
    this.img,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return img != null
        ? FadeInImage(
            placeholder:
                const AssetImage('assets/images/music_placeholder.png'),
            image: AssetImage(img!),
            fit: BoxFit.cover,
            width: width,
            height: heigth,
          )
        : Image.asset(
            'assets/images/music_placeholder.png',
            width: width,
            height: heigth,
            fit: BoxFit.cover,
          );
  }
}
