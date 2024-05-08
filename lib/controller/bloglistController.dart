

import 'package:get/get.dart';
import '../service/firebase_collection.dart';

class bloglistController extends GetxController
    with StateMixin<dynamic> {
  List ArticleList=[];
  @override
  void onInit() {
    // TODO: implement onInit
    getBlogListByFirebase();
    super.onInit();
  }



  Future<void> getBlogListByFirebase() async {
    try{
      ArticleList=await Firebase_collection().getAllblog();
      change(ArticleList, status: RxStatus.success());
    }catch(e){
      print(e);
    change([], status: RxStatus.error('Please try again'));
    }
  }


// Future<dynamic> getblogList() async {
//   try{
//     var get_articles= await Provider().getblogList();
//     print('getblogList');
//     print(get_articles);
//     if(get_articles.status=='ok'){
//       ArticleList=get_articles.articles??[];
//       print(ArticleList.first.toJson());
//       print(ArticleList.first.blog_id);
//       for(int i=0;i<ArticleList.length;i++){
//         var blog_data= ArticleList[i].toJson();
//        await  Firebase_collection().add_blog_data(blog_data);
//       }
//
//     }
//     change(ArticleList, status: RxStatus.success());
//   }catch(e){
//     print(e);
//     change([], status: RxStatus.error('Please try again'));
//   }
// }
}