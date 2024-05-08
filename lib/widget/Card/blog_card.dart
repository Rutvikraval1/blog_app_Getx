import 'package:blog_app/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../Date_and_time/DateAndTime.dart';
import '../asset_img.dart';

class BlogCard extends StatelessWidget {
  final Function onTap;
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String publishedAt;

  BlogCard({
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
              Asset_imge_show().fadeInImage_network(image_path: imageUrl,boxFit: BoxFit.cover)
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: App_style().text_16_black_bold
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Author: $author',
                                style: App_style().text_14
                            ),
                            Text(
                                'Published at: ${Date_And_Time().getDateFormate(publishedAt)}',
                                style:App_style().text_14
                            ),
                          ],
                        )),
                        TextButton(
                          onPressed: () {
                            onTap();
                          },
                          child: Text(
                            'Read More',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
