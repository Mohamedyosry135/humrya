import 'package:get/get.dart';

import '../presentation/controllers/players_controller.dart';

class PlayersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayersController());
  }
}