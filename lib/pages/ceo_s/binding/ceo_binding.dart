import 'package:example_structure/pages/ceo_s/presentation/controllers/ceo_controller.dart';
import 'package:get/get.dart';

class CeoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CeoController());
  }
}