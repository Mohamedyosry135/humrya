import 'package:example_structure/pages/football/presentations/controllers/football_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class FootballBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FootballController());
  }
}