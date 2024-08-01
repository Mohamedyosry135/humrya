import 'package:example_structure/pages/gallery/presentation/controllers/gallery_controller.dart';
import 'package:get/get.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GalleryController());
  }
}