import 'package:example_structure/models/football_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

class FootballController extends SuperController<dynamic> {
  Rx<FootBallModel> footBall = FootBallModel().obs;
  int? id;
  String? title;
  
  
  Future fetchData() async {
    change(false,status: RxStatus.loading());
    await DioHelper.getData(url: 'team_games/$id').then((value) {
     footBall.value = FootBallModel.fromJson(value.data);
     change(false,status: RxStatus.success());
    }).catchError((e){
      change(false,status: RxStatus.error(e.toString()));
    });
    
  }
  
  
  @override
  void onInit() {
    id = Get.arguments[0];
    title = Get.arguments[1];
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
