
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/bloglistController.dart';
import 'package:flutter/material.dart';

import '../pages/page_route_name.dart';
import '../service/deepLinkiing/deep_link_service.dart';
import '../utils/app_locale.dart';
import '../widget/Card/blogDetails.dart';
import '../widget/Card/blog_card.dart';
import '../widget/Scaffold_widget.dart';
import '../widget/appbar_common.dart';
import 'blogDetails_screen.dart';

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
                    shareonTap: (){
                      referBlog(controller.ArticleList[index]['blog_id']??'');
                    },
                    onTap: (){
                     Get.toNamed(blogDetails_page,arguments: controller.ArticleList[index]['blog_id']??'');
                    },
                    title: controller.ArticleList[index]['title']??'',
                    blog_id: controller.ArticleList[index]['blog_id']??'',
                    author: controller.ArticleList[index]['author']??'',
                    description:controller.ArticleList[index]['description']??'' ,
                    imageUrl:controller.ArticleList[index]['urlToImage']??'' ,
                    publishedAt:controller.ArticleList[index]['publishedAt']??'' ,
                  ),
                  cus_size_box().sizedBox_10,
                ],
              ),)
        )
    );
  }
  Future<void> referBlog(String blog_id) async {
    print('blog_id');
    print(blog_id);
    final referLink = await DeepLinkService.instance?.createReferralLink(referralCode: blog_id);
    print('referLink');
    print(referLink);
    if (referLink != null) {
      String app_referLink = referLink;
      Share_referaal(app_referLink);
    }
  }
  Future<void> Share_referaal(String app_referLink) async {
    // final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      app_referLink,
      subject: "Blog Details",
    );
  }
}