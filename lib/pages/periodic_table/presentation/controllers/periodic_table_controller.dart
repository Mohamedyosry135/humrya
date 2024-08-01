import 'package:get/get.dart';

import '../../../../models/single_team_game_team.dart';

class PeriodicTableController extends SuperController<dynamic>{
  Rx<SingleTeamGameTeamModel> team = SingleTeamGameTeamModel().obs;



  @override
  void onInit() {
  team = Get.arguments[0];
    super.onInit();
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}