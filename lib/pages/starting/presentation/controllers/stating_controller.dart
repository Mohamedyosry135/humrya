import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/dio_helper.dart';
import '../../../../widgets/toast_widget.dart';

class StartingController extends SuperController<dynamic> {
  RxString content = ''.obs;
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'settings/about_club')
        .then((value) {
      if(value.statusCode == 200){
        content.value  =  value.data['data']['content'];
        change(false,status: RxStatus.success());
      }else{
        change(false,status: RxStatus.error());
      }
    })
        .catchError((e) {
      change(false,status: RxStatus.error());
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