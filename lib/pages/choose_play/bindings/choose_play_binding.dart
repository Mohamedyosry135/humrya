import 'package:get/get.dart';

import '../presentations/controllers/choose_play_controller.dart';

class chooseplayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoosePlayController());
  }
}