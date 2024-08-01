import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../models/members_model.dart';
import '../../../../widgets/toast_widget.dart';


class CeoController extends SuperController<dynamic> {
  RxList<MembersModel> members = <MembersModel>[].obs;
  RxList<MembersModel> apiMembers = <MembersModel>[].obs;

  MembersModel ceo = MembersModel();
  Future getData(BuildContext context) async {
    change(false,status: RxStatus.loading());
    DioHelper.getData(url: 'boards')
        .then((value) {
      if(value.statusCode == 200){
        print(value.data);
        apiMembers.clear();
        value.data['data'].forEach((e){
          apiMembers.add(MembersModel.fromJson(e));
        });
        ceo = apiMembers[0];
        for(int i  = 1;i < apiMembers.length;i++){
          members.add(apiMembers[i]);
        }

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
    // TODO: implement onInit
    getData(Get.context!);
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