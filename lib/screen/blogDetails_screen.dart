
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/blogDetailsController.dart';
import '../widget/Card/blogDetails.dart';
import '../widget/Scaffold_widget.dart';
import '../widget/appbar_common.dart';
class blogDetails extends GetView<blogDetailsController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
        appBar: MainAppBar(title: 'Blog Details',leading: true),
        body:  controller.obx((data) =>
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: BlogDetailsCard(
              title: controller.ArticleList['title']??'',
              author: controller.ArticleList['author']??'',
              description:controller.ArticleList['description']??'' ,
              imageUrl:controller.ArticleList['urlToImage']??'' ,
              publishedAt:controller.ArticleList['publishedAt']??'' ,
            ),
          ),
        )
        )
    );
  }
}