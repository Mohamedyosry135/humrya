import 'package:example_structure/pages/achievements/presentation/controllers/achieve_controller.dart';
import 'package:get/get.dart';

class AchieveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AchieveController());
  }
}