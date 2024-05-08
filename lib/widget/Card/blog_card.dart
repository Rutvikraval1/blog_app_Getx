import 'package:blog_app/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../../service/deepLinkiing/deep_link_service.dart';
import '../Date_and_time/DateAndTime.dart';
import '../asset_img.dart';

class BlogCard extends StatelessWidget {
  final Function onTap;
  final Function shareonTap;
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String blog_id;

  BlogCard({
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.shareonTap,
    required this.author,
    required this.publishedAt,
    required this.blog_id,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,top: 40,right: 8,bottom: 8),
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
          Positioned(
              right: 8,

              // bottom: 35,
              child: IconButton(onPressed: (){
            shareonTap();
          },icon: const Icon(Icons.share),))
        ],
      ),
    );
  }
}
