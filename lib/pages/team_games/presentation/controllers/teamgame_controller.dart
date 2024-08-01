import 'package:example_structure/models/game_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/dio_helper.dart';
import '../../../../widgets/toast_widget.dart';

class TeamGamesController extends SuperController<dynamic> {
  RxList<GameModel> teamGames = <GameModel>[].obs;
  bool toRegister = false;
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'team_games')
        .then((value) {
      if(value.statusCode == 200){
        print(value.data);
        teamGames.clear();
        value.data['team_games'].forEach((e){
          teamGames.add(GameModel.fromJson(e));
        });

        change(false,status: RxStatus.success());
      }else{
        change(false,status: RxStatus.error());
      }
    })
        .catchError((e) {
      change(false,status: RxStatus.error());
      print(e.toString());
      ToastWidget().showToast(context, message: 'خطأ', type: ToastTypes.error);
    });
  }
  @override
  void onInit() {
    toRegister = Get.arguments[0];
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