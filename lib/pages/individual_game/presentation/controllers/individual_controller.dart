import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/game_model.dart';
import '../../../../services/dio_helper.dart';
import '../../../../widgets/toast_widget.dart';

class individualController extends SuperController<dynamic> {
  RxList<GameModel> individualGames = <GameModel>[].obs;
  bool toRegister = false;
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'individual_games')
        .then((value) {
      if(value.statusCode == 200){
        print(value.data);
        individualGames.clear();
        value.data['individual_games'].forEach((e){
          individualGames.add(GameModel.fromJson(e));
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