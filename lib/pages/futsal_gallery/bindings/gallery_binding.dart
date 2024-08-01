import 'package:get/get.dart';

import '../presentation/controllers/gallery_controller.dart';

class FutsalGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FutsaGalleryController());
  }
}