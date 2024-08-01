import 'package:get/get.dart';
import '../presentation/controllers/sharqa_clubs_gallery_controller.dart';

class SharqaClubsGalleryBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SharqaClubsGalleryController());

  }

}