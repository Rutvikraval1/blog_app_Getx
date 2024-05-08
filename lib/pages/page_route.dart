



import 'package:blog_app/pages/page_route_name.dart';
import 'package:get/get.dart';
import '../binding/binding_pages.dart';
import '../screen/blogDetails_screen.dart';
import '../screen/blogList.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: route_blogList,
        page: () => blogList(),
        binding: DataBinding()),
    GetPage(name: blogDetails_page,
        page: () => blogDetails(),
        binding: DataBinding()),
  ];
}