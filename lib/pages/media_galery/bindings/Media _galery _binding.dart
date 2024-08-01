import 'package:get/get.dart';

import '../presentation/controllers/Media_galery _controller.dart';

class MediagaleryBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(MediagaleryController());
  }
}