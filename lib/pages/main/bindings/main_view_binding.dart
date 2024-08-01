

import 'package:example_structure/pages/main/presentation/controller/main_controller.dart';
import 'package:example_structure/pages/sports_game/presentation/controllers/sportsgame_controller.dart';
import 'package:get/get.dart';

class MainViewBinding extends Bindings {
  @override
  void dependencies() {
Get.put(MainViewController());
Get.put(SportsgameController());

  }
}
