import 'package:get/get.dart';

import '../presentation/controllers/Media _Center _controller.dart';

class MediaCenterBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(MediaCenterController());
  }
}