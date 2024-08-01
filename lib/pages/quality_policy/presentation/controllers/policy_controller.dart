import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/dio_helper.dart';
import '../../../../widgets/toast_widget.dart';

class PolicyCintroller extends SuperController<dynamic> {
  RxString title = ''.obs;
  RxString content = ''.obs;
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'settings/quality_policy')
        .then((value) {
      if(value.statusCode == 200){
        print(value.data);
      title.value = value.data['data']['title'];
        content.value = value.data['data']['content'];
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