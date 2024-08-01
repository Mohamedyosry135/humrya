import 'package:example_structure/pages/starting/presentation/controllers/stating_controller.dart';
import 'package:get/get.dart';

class StartingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StartingController());
  }
}