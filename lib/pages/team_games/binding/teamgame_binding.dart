import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/controllers/teamgame_controller.dart';


class teamgameBinding extends Bindings {
  BuildContext context;
  teamgameBinding({required this.context});
  @override
  void dependencies() {
   Get.put(TeamGamesController()..getData(context));
  }

}