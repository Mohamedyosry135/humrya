import 'package:example_structure/pages/login/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
  }
}
