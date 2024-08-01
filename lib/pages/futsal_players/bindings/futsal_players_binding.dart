import 'package:get/get.dart';

import '../presentation/controllers/futsal_players_controller.dart';

class FutsalPlayersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FutsalPlayersController());
  }
}