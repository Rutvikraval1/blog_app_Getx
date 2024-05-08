
import 'package:get/get.dart';

import '../controller/bloglistController.dart';
import 'package:flutter/material.dart';

import '../utils/app_locale.dart';
import '../widget/Card/blogDetails.dart';
import '../widget/Card/blog_card.dart';
import '../widget/Scaffold_widget.dart';
import '../widget/appbar_common.dart';

class blogList extends GetView<bloglistController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
      appBar: MainAppBar(title: 'Blog'),
        body:  controller.obx((data) =>
            ListView.builder(
              itemCount: controller.ArticleList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  BlogCard(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlogDetailsPage(
                        title: controller.ArticleList[index].title??'',
                        author: controller.ArticleList[index].author??'',
                        description:controller.ArticleList[index].description??'' ,
                        imageUrl:controller.ArticleList[index].urlToImage??'' ,
                        publishedAt:controller.ArticleList[index].publishedAt??'' ,
                      ),));
                    },
                    title: controller.ArticleList[index].title??'',
                    author: controller.ArticleList[index].author??'',
                    description:controller.ArticleList[index].description??'' ,
                    imageUrl:controller.ArticleList[index].urlToImage??'' ,
                    publishedAt:controller.ArticleList[index].publishedAt??'' ,
                  ),
                  cus_size_box().sizedBox_10,
                ],
              ),)
        )
    );
  }
}