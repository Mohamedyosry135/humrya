
import 'package:dio/dio.dart';
import 'package:example_structure/base/api_end_points.dart';
import 'package:example_structure/pages/otp/bindings/otp_binding.dart';
import 'package:example_structure/pages/otp/presentation/views/otp_view.dart';
import 'package:example_structure/routes/app_pages.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../../../../widgets/toast_widget.dart';

class SignUpController extends SuperController<bool> {

  RxBool hidePass = true.obs;


  Future signUp(
      {required String firstName,
      required String password,
      required String phone,
        required BuildContext context,
      required String lastName}) async {
      Get.toNamed(
          Routes.OTP,
          arguments: {
            "phone" : phone,
            "first_name" : firstName,
            "last_name" : lastName,
            "password" : password,
          }
      );
    change(false,status: RxStatus.loading());
    try {
      Response response =
          await DioHelper.postData(url: EndPoints.SignUp, data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phone,
        "password": password
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data['otp'].toString());
        Get.toNamed(
            Routes.OTP,
            arguments: {
              "phone" : phone,
              "first_name" : firstName,
              "last_name" : lastName,
              "password" : password,
            }
        );
        ToastWidget().showToast(
          context,
          message: response.data['message'].toString(),
          type: ToastTypes.success,
        );
      } else {
        ToastWidget().showToast(
          context,
          message: response.data['message'].toString(),
          type: ToastTypes.error,
        );
      }

    } catch (e) {
      print(e.toString());
    if(e is DioError){
      ToastWidget().showToast(
        context,
        message: e.response?.data['message'],
        type: ToastTypes.error,
      );
    }
    }finally{
      change(true,status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    // Get.rootDelegate.toNamed(Routes.ALL_TASKS);
    super.onInit();

    change(null, status: RxStatus.success());
  }

  onLoginClicked() {
    change(false, status: RxStatus.loading());
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
