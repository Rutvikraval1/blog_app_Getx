import 'package:blog_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/app_style.dart';
import '../Date_and_time/DateAndTime.dart';
import '../appbar_common.dart';
import '../asset_img.dart';

class BlogDetailsCard extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  BlogDetailsCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            title,
            style: App_style().text_16_black_bold
        ),
        const SizedBox(height: 20.0),
        Asset_imge_show().fadeInImage_network(image_path: imageUrl,boxFit: BoxFit.cover),
        const SizedBox(height: 20.0),
        Text(
          description,
          style:  App_style().text_16_black_bold,
        ),
        const SizedBox(height: 20.0),
        Text(
            'Author: $author',
            style:  App_style().text_14
        ),
        Text(
            'Published at: ${Date_And_Time().getDateFormate(publishedAt)}',
            style: App_style().text_14
        ),
      ],
    );
  }
}