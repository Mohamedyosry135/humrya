import 'package:example_structure/pages/cultural_center/presentation/controllers/cultural_center_controller.dart';
import 'package:get/get.dart';

class CulturalCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CulturalCenterController());
  }
}