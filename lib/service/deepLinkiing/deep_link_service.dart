
import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/deep_link_refer_model.dart';
import '../../pages/page_route_name.dart';
import '../../widget/Card/blogDetails.dart';

class DeepLinkService {
  DeepLinkService._();
  static DeepLinkService? _instance;
  Deep_link_refer myObject = Deep_link_refer();
  static DeepLinkService? get instance {
    _instance ??= DeepLinkService._();
    return _instance;
  }
  final dynamicLink = FirebaseDynamicLinks.instance;
  Future<void> handleDynamicLinks() async {

    //Get initial dynamic link if app is started using the link
    final data = await dynamicLink.getInitialLink();
    debugPrint('deepLink_data: $data');
    if (data != null) {
      _handleDeepLink(data);
    }
    //handle foreground
    dynamicLink.onLink.listen((event) {
      _handleDeepLink(event);
    }).onError((v) {
      debugPrint('deepLink_Failed: $v');
      print('Failed: $v');
      log('Failed: $v');
    });
  }

  Future<String> createReferralLink({String referralCode=''}) async {
    final DynamicLinkParameters parameters  = DynamicLinkParameters(
      uriPrefix: 'https://blognews.page.link',
      link: Uri.parse('https://blognews.page.link/refer?code=$referralCode'),
      androidParameters: const AndroidParameters(
        packageName:  'com.example.blog_app',
      ),
      socialMetaTagParameters: const SocialMetaTagParameters(
        title: 'Refer A Blog',
        description: 'Read Blog Details',
        // imageUrl: Uri.parse(refer_iamge),
      ),
    );
    final ShortDynamicLink shortLink = await dynamicLink.buildShortLink(parameters);
    final Uri dynamicUrl = shortLink.shortUrl;
    print(dynamicUrl);
    return dynamicUrl.toString();
  }

  Future<void> _handleDeepLink(PendingDynamicLinkData data) async {
    final Uri deepLink = data.link;
    print('deepLink'); //refeaal_user_code
    print(deepLink);
    debugPrint('deepLink: $deepLink');
    log('deepLink: $Uri');
    var isRefer = deepLink.pathSegments.contains('refer');
    if (isRefer) {
      var code = deepLink.queryParameters['code'];
      var data= code.toString();
      print('isRefer'); //refeaal_user_code
      print(data); //refeaal_user_code
      myObject.setReferUserid= code.toString();
      debugPrint('deepLink_getUserid: ${myObject.getReferUserid}');

      if (data.isNotEmpty) {
        Get.toNamed(blogDetails_page,arguments: code??'');
        // Get.to(() => BlogDetailsPage());
      }
    }
  }

}
