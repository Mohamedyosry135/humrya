import 'package:dio/dio.dart';
import 'package:example_structure/base/api_end_points.dart';
import 'package:example_structure/models/teamplayer_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class FutsalPlayersController extends SuperController<dynamic> {
  Rx<TeamPlayerGameModel> teamplayer = TeamPlayerGameModel().obs;

  late String id='1' ;



  Future getTeam() async {
    change(false,status: RxStatus.loading());
    try {
      Response response =
      await DioHelper.getData(url: EndPoints.team+id,);
      if (response.statusCode == 200 || response.statusCode == 201) {
        teamplayer.value = TeamPlayerGameModel.fromJson(response.data);
        print(response.data.toString());
        change(false,status: RxStatus.success());

      } else {

      }
    } catch (e) {
      print(e.toString());
      if(e is DioError){
        change(false,status: RxStatus.error());
      }else{
        change(false,status: RxStatus.error());
      }
    }
  }
  @override
  void onInit() {
    getTeam();
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
