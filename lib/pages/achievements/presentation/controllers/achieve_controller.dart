import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/home_model.dart';
import '../../../../widgets/toast_widget.dart';

class AchieveController extends SuperController<dynamic>{
  RxList<Achievements> achieve = <Achievements>[].obs;
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'achievements')
        .then((value) {
      if(value.statusCode == 200){
        print(value.data);
        achieve.clear();
      value.data['data'].forEach((e){
        achieve.add(Achievements.fromJson(e));
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
   getData(Get.context!);
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