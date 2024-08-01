import 'package:dio/dio.dart';
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/pages/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

import '../../../../base/api_end_points.dart';
import '../../../../services/dio_helper.dart';
import '../../../../widgets/toast_widget.dart';

class LogInController extends SuperController<dynamic> {
  RxBool rememberMe = false.obs;
  RxBool hidePass = true.obs;
  RxBool phoneEditable = true.obs;
  RxBool isResetPass = false.obs;
  GetStorage box = GetStorage();
  rememberMeSwap() {
    rememberMe.value = !rememberMe.value;
  }


  Future sendOTP(dynamic data) async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.postData(url: 'auth/forgot_password',data: data);
      if(response.statusCode == 200){

        phoneEditable.value = false;
        isResetPass.value = true;
        change(false,status: RxStatus.success());
      }else {
        change(false,status: RxStatus.success());
      }
    }catch(e){
      change(false,status: RxStatus.success());
    }
  }


  Future resetPassword(dynamic data,BuildContext context) async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.postData(url: 'auth/reset_password',data: data);
      if(response.statusCode == 200){
    Get.offAll(const OnBoardingView());
        change(false,status: RxStatus.success());
      }else {
        change(false,status: RxStatus.success());
      }
    }catch(e){
      if(e is DioError){

        ToastWidget().showToast(context, message: e.response?.data['message'], type: ToastTypes.error);
      }
      change(false,status: RxStatus.success());
    }
  }




  Future signIn({
    required String password,
    required String phone,
    required BuildContext context,
  }) async {
    change(false,status: RxStatus.loading());
    try {
      Response response = await DioHelper.postData(
          url: EndPoints.SignIn,
          data: {"phone_number": phone, "password": password});
      if (response.statusCode == 200 || response.statusCode == 201) {

        box.write(StorageKeys.token, response.data['access_token'].toString());
        change(false,status: RxStatus.success());
        Get.offAll(const MainScreenView(),binding: MainViewBinding());
        ToastWidget().showToast(
          Get.context!,
          message: 'تم تسجيل الدخول بنجاح',
          type: ToastTypes.success,
        );
      } else {
        change(false,status: RxStatus.success());
        ToastWidget().showToast(
          Get.context!,
          message: 'رقم الهاتف او كلمة السر غير صحيحه',
          type: ToastTypes.error,
        );
      }
    } catch (e) {
      change(false,status: RxStatus.success());

      if (e is DioError) {
        ToastWidget().showToast(
          context,
          message: 'رقم الهاتف او كلمة السر غير صحيحه' ,
          type: ToastTypes.error,
        );
      } else {
        ToastWidget().showToast(
          context,
          message: 'error',
          type: ToastTypes.error,
        );
      }
    }
  }
  @override
  void onInit() {
    change(false,status: RxStatus.success());
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
