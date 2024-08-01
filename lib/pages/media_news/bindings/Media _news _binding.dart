import 'package:get/get.dart';

import '../presentation/controllers/Media_news _controller.dart';

class MedianewsBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(MedianewsController());
  }
}