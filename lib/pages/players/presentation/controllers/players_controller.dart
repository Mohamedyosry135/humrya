import 'package:dio/dio.dart';
import 'package:example_structure/models/team_player_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;

class PlayersController extends SuperController<dynamic>{
Rx<TeamPlayersModel> players = TeamPlayersModel().obs;
int? id;

Future fetchData () async {
  change(false,status: RxStatus.loading());
  try{
    Response response = await DioHelper.getData(url: 'team/$id/players');
    if(response.statusCode == 200 ) {
      players.value = TeamPlayersModel.fromJson(response.data);
      change(false,status: RxStatus.success());
    }else {
      change(false,status: RxStatus.success());
    }
  }catch(e){
    change(false,status: RxStatus.success());
    rethrow;
  }

}

  @override
  void onInit() {
    id = Get.arguments[0];
    fetchData();
    super.onInit();
  }
  @override
  void onDetached() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }
}