
import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screen/dashboard/dashboard_screen.dart';
import '../../Screen/modal/deep_link_refer_model.dart';
import '../../utils/app_locale.dart';

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
    String refer_iamge='https://firebasestorage.googleapis.com/v0/b/myneber-89358.appspot.com/o/App_logo%2Fmyneber_favicon_icon.png?alt=media&token=28ac4b5e-f571-4b6c-bc9d-391f568dfd6a';
    final DynamicLinkParameters parameters  = DynamicLinkParameters(
      uriPrefix: Custom_input.deeplink_app,
      link: Uri.parse('https://myneber.com/refer?code=$referralCode'),
      androidParameters: const AndroidParameters(
        packageName:  Custom_input.android_packageName,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.ksmyneber.ios',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Refer A Friend',
        description: 'Refer and earn',
        imageUrl: Uri.parse(refer_iamge),
      ),
    );

    final ShortDynamicLink shortLink = await dynamicLink.buildShortLink(parameters);

    final Uri dynamicUrl = shortLink.shortUrl;
    print(dynamicUrl);
    return dynamicUrl.toString();
  }

  Future<void> _handleDeepLink(PendingDynamicLinkData data) async {
    final Uri deepLink = data.link;
    debugPrint('deepLink: $deepLink');
    log('deepLink: $Uri');
    var isRefer = deepLink.pathSegments.contains('refer');
    if (isRefer) {
      var code = deepLink.queryParameters['code'];
      var data= code.toString().split('=');
      log('isRefer: $data');
      debugPrint('deepLink_isRefer: $data');
      print('isRefer'); //refeaal_user_code
      print(data[0]); //refeaal_user_code
      myObject.setReferUserid= data[0].toString();


      debugPrint('deepLink_getUserid: ${myObject.getReferUserid}');

///
      // var json_of_notifi={
      //   "job_post_id":data[0],
      //   "apply_date_time": Date_And_Time().datetime_milsecond,
      //   "user_id":data[1],
      //   "Referral_status": '0',
      //   "refer_user_list": FieldValue.arrayUnion([Preferences.getStringValuesSF(Preferences.USER_ID)])
      // };
      //
      // if(Preferences.getStringValuesSF(Preferences.USER_ROLE_TYPE)!='employer'){
      //   if(data[1]!=Preferences.getStringValuesSF(Preferences.USER_ID)){
      //     final check_job_post_id_referral = await FirebaseFirestore.instance
      //         .collection(Fire_collection_Name().User_data)
      //         .doc(Preferences.getStringValuesSF(Preferences.USER_ID)).collection(Fire_collection_Name().Referral_list)
      //         .where('job_post_id', isEqualTo: data[0])
      //         .get();
      //     var referral_doc_id=check_job_post_id_referral.docs[0]['referral_doc_id'];
      //     if (check_job_post_id_referral.docs.isEmpty) {
      //       print('step 1');
      //       await Firebase_collection().Referral_list_add(json_of_notifi,data[1]);
      //     }else{
      //       print('step 2');
      //       await Firebase_collection().Referral_list_Update(json_of_notifi,referral_doc_id,data[1]);
      //     }
      //   }
      // }

      if (data.isNotEmpty) {
        Get.to(() =>  dashboard_screen());
      }
    }
  }

}
