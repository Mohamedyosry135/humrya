import 'package:get/get.dart';

import '../presentation/controllers/sportsgame_controller.dart';

class SportsgameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SportsgameController());
    Get.find<SportsgameController>().isBack = true;
    Get.find<SportsgameController>().toRegister = false;
  }
}
