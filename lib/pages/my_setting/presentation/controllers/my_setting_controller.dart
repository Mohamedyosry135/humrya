import 'package:dio/dio.dart';
import 'package:example_structure/pages/my_account/presentation/controllers/my_account_controller.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:get/get.dart' hide Response;

class MySettingController extends SuperController<dynamic> {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  RxBool isLoading = false.obs;
  Future editProfileName({required String first, required String last}) async {
    isLoading.value = true;
    try {
      Response response = await DioHelper.postData(
          url: 'profile', data: {"first_name": first, "last_name": last});
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.back();
        Get.back();
        Get.find<MyAccountController>().fetchProfile();
      }
    } catch (e) {
      isLoading.value = false;
    }
  }


  Future editPassword({required String oldPass, required String newPass,required String confirmPass}) async {
    isLoading.value = true;
    try {
      Response response = await DioHelper.postData(
          url: 'auth/update-password', data: {"current_password": oldPass, "new_password": newPass,"confirm_password" : confirmPass });
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.back();
        Get.back();
        Get.find<MyAccountController>().fetchProfile();
      }else  {
        ToastWidget().showToast(Get.context!, message: 'error', type: ToastTypes.error);
      }
    } catch (e) {
      if(e is DioError){
       ToastWidget().showToast(Get.context!, message: e.response?.data['error'], type: ToastTypes.error);
      }
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    firstName = Get.arguments[0];
    lastName = Get.arguments[1];
    phone = Get.arguments[2];
    email = Get.arguments[3];
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
