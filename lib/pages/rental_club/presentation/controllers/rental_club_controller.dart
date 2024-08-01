import 'package:example_structure/base/api_end_points.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

import '../../../../models/all_facilities_model.dart';

class RentalClubController extends SuperController<dynamic> {
  Rx<AllFacilitiesModel> facilities = AllFacilitiesModel().obs;
  Future fetchData() async {
    change(false,status: RxStatus.loading());
    await DioHelper.getData(url: EndPoints.facilities).then((value) {
     facilities.value = AllFacilitiesModel.fromJson(value.data);
     change(false,status: RxStatus.success());
    }).catchError((e) {});
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
