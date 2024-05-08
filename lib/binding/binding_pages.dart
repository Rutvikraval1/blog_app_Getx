
import 'package:get/get.dart';

import '../controller/blogDetailsController.dart';
import '../controller/bloglistController.dart';


class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => bloglistController());
    Get.lazyPut(() => blogDetailsController());
  }
}
