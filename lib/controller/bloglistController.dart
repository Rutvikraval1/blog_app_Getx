

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../service/pref_manager.dart';
import '../../../utils/app_locale.dart';
import '../../../widget/Flutter_toast_mes.dart';
import '../Model/bloglistModel.dart';
import '../provider/provider.dart';

class bloglistController extends GetxController
    with StateMixin<dynamic> {
  List<Article> ArticleList=[];
  @override
  void onInit() {
    // TODO: implement onInit
    getblogList();
    super.onInit();
  }

  Future<dynamic> getblogList() async {
    try{
      var get_articles= await Provider().getblogList();
      print('getblogList');
      print(get_articles);
      if(get_articles.status=='ok'){
        ArticleList=get_articles.articles??[];
      }
      change(ArticleList, status: RxStatus.success());
    }catch(e){
      print(e);
      change([], status: RxStatus.error('Please try again'));
    }
  }
}