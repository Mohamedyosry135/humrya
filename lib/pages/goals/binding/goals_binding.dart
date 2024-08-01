import 'package:example_structure/pages/goals/presentation/controllers/goals_controller.dart';
import 'package:get/get.dart';

class GoalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoalsController());
  }
}