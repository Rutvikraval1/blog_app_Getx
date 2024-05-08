


import '../Model/bloglistModel.dart';
import '../service/globle_data.dart';

class Provider{
  Future<BlogData> getblogList() async {

    final data= await Network().httpClient_request(page_name: 'top-headlines?country=us&category=business');

    return blogDataFromJson(data.toString());
  }
}