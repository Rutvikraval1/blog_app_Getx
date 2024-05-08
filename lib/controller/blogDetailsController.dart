
import 'package:get/get.dart';
import '../service/firebase_collection.dart';
class blogDetailsController extends GetxController
    with StateMixin<dynamic> {
  var ArticleList;
  String docId='';

  @override
  void onInit() {
    // TODO: implement onInit
    docId=Get.arguments;
    print("docId");
    print(docId);
    getBlogByFirebase();
    super.onInit();
  }

  Future<void> getBlogByFirebase() async {
    try{
      ArticleList=await Firebase_collection().getParticulerblog(docId: docId);
      change(ArticleList, status: RxStatus.success());
    }catch(e){
      print(e);
      change([], status: RxStatus.error('Please try again'));
    }
  }
}