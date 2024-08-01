import 'package:dio/dio.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;

import '../../../../models/single_team_game_team.dart';

class FirstTeamController extends SuperController<dynamic> {
int? id;


  Rx<SingleTeamGameTeamModel> team = SingleTeamGameTeamModel().obs;

  Future fetchData() async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.getData(url: 'team/$id');
      if(response.statusCode == 200){
        team.value = SingleTeamGameTeamModel.fromJson(response.data);
        change(true,status: RxStatus.success());
      }
    }catch(e){

      if(e is DioError){
        print(e.response?.data);
      }

      change(true,status: RxStatus.success());
      rethrow;
    }
  }





  @override
  void onInit() {
    id = Get.arguments[0];
    print(id);


 fetchData();
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