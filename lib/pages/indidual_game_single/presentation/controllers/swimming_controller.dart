import 'package:example_structure/models/single_indidual_game_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

class SingleIndividualGameController extends SuperController<dynamic> {
  int? id;
  Rx<SingleIndividualGameModel> gameData = SingleIndividualGameModel().obs;

  Future fetchData() async {
    change(false,status: RxStatus.loading());
    await DioHelper.getData(url: 'individual_games/$id').then((value) {
     gameData.value = SingleIndividualGameModel.fromJson(value.data);
     change(false,status: RxStatus.success());
    }).catchError((e){
      change(false,status: RxStatus.error(e.toString()));
      throw e;
    });
  }

  @override
  void onInit() {
    id = Get.arguments[0];
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
