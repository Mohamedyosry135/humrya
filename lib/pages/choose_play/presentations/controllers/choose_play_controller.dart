import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

import '../../../../models/acadimies_model.dart';

class ChoosePlayController extends SuperController<dynamic> {
  Rx<AcademiesModel> academies = AcademiesModel().obs;
  Future fetchData() async {
    change(false,status: RxStatus.loading());
    await DioHelper.getData(url: 'academies').then((value) {
    academies.value = AcademiesModel.fromJson(value.data);
    change(false,status: RxStatus.success());
    }).catchError((e) {
      change(false,status: RxStatus.error(e.toString()));
      throw e;
    });
  }

  @override
  void onInit() {
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
