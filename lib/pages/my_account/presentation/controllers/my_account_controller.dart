import 'package:dio/dio.dart';
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/models/profile_model.dart';
import 'package:example_structure/pages/onboarding/bindings/onboarding_binding.dart';
import 'package:example_structure/pages/onboarding/presentation/views/onboarding_view.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/widgets/custom_button_container.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountController extends SuperController<dynamic> {
  Rx<ProfileModel> profile = ProfileModel().obs;
  RxBool deleteWaiting =  false.obs;
  Future fetchProfile() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(url: 'profile');
      if (response.statusCode == 200) {
        profile.value = ProfileModel.fromJson(response.data);
        change(false, status: RxStatus.success());
      } else if (response.statusCode == 401) {
        Get.defaultDialog(
            title: 'يجب تسجيل الدخول اولا',
            content: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomButtonContainer(
                  InkWell(
                      onTap: () {
                        Get.offAll(const OnBoardingView(),
                            binding: OnBoardingBinding());
                      },
                      child: const Center(
                          child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ))),
                  width: 1.sw * 0.6,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color(ColorCode.primary),
                      borderRadius: BorderRadius.circular(15.r)),
                )
              ],
            ));
        change(false, status: RxStatus.error());
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          Get.defaultDialog(
              title: 'يجب تسجيل الدخول اولا',
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonContainer(
                    InkWell(
                        onTap: () {
                          Get.offAll(const OnBoardingView(),
                              binding: OnBoardingBinding());
                        },
                        child: const Center(
                            child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ))),
                    width: 1.sw * 0.6,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.primary),
                        borderRadius: BorderRadius.circular(15.r)),
                  )
                ],
              ));
        }
      }
      change(false, status: RxStatus.error(e.toString()));
      rethrow;
    }
  }

  Future deleteAccount() async {
    deleteWaiting.value  = true;
    try {
      Response response = await DioHelper.deleteData(url: 'auth/user');
      if (response.statusCode == 200) {
        profile.value = ProfileModel.fromJson(response.data);
        GetStorage().remove(StorageKeys.token);
        Get.offAll(const OnBoardingView());
        deleteWaiting.value  = false;
      } else if (response.statusCode == 401) {
        Get.defaultDialog(
            title: 'يجب تسجيل الدخول اولا',
            content: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomButtonContainer(
                  InkWell(
                      onTap: () {
                        Get.offAll(const OnBoardingView(),
                            binding: OnBoardingBinding());
                      },
                      child: const Center(
                          child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ))),
                  width: 1.sw * 0.6,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color(ColorCode.primary),
                      borderRadius: BorderRadius.circular(15.r)),
                )
              ],
            ));
        deleteWaiting.value  = false;
      }else {
        ToastWidget().showToast(Get.context!, message: 'خطأ', type: ToastTypes.error);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          Get.defaultDialog(
              title: 'يجب تسجيل الدخول اولا',
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonContainer(
                    InkWell(
                        onTap: () {
                          Get.offAll(const OnBoardingView(),
                              binding: OnBoardingBinding());
                        },
                        child: const Center(
                            child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ))),
                    width: 1.sw * 0.6,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.primary),
                        borderRadius: BorderRadius.circular(15.r)),
                  )
                ],
              ));
        }
      }
      ToastWidget().showToast(Get.context!, message: 'خطأ', type: ToastTypes.error);
      deleteWaiting.value  = false;
      rethrow;
    }
  }

  @override
  void onInit() {
    fetchProfile();
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
