import 'package:dio/dio.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../main/bindings/main_view_binding.dart';
import '../../../main/presentation/controller/main_controller.dart';
import '../../../main/presentation/views/main_view.dart';

class SubscribeController extends SuperController<dynamic> {
  int? id;
  bool? toRegisterGame;
  bool? teamGame;
  XFile? imageId;
  XFile? imagePersonal;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController qualificationsController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fatherPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  Future sendSubscription() async {
    change(false, status: RxStatus.loading());
    FormData formData = FormData.fromMap({
      "academy_id": id,
      "full_name": fullNameController.text,
      "birth_date": birthDateController.text,
      "birth_place": birthPlaceController.text,
      "nationality": nationalityController.text,
      "qualification": qualificationsController.text,
      "address": addressController.text,
      "region": regionController.text,
      "school": schoolController.text,
      "phone": phoneController.text,
      "father_phone": fatherPhoneController.text,
      "email": emailController.text,
      "experience": experienceController.text,
      "personal_id":
          await MultipartFile.fromFile(imageId!.path, filename: imageId!.name),
      "personal_image": await MultipartFile.fromFile(imagePersonal!.path,
          filename: imagePersonal!.name),
    });
    await DioHelper.postData(url: 'academies/reserve', data: formData)
        .then((value) {
      Get.dialog(
        AlertDialog(
          content: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
            height: 365.h,
            width: 315.w,
            child: Column(children: [
              Image(
                image: AppAssets.Vector,
                height: 114.h,
                width: 114.w,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomText(
                'تم التسجيل',
                textStyle: TextStyles.text16.copyWith(
                  color: const Color(ColorCode.primary),
                  fontSize: 18,
                ),
              ),
              CustomText(
                'سيتم التواصل معكم قريباً',
                textStyle: TextStyles.text16.copyWith(
                    color: const Color(ColorCode.grey),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              CustomButtonContainer(
                InkWell(
                  onTap: () {
                    Get.offAll(() => const MainScreenView(),
                        binding: MainViewBinding());
                    Get.find<MainViewController>().navIndex.value = 2;

                    Get.find<MainViewController>().navController.value =
                        PersistentTabController(initialIndex: 2);
                  },
                  child: Center(
                      child: CustomText(
                    'عودة إلى الرئيسية',
                    textStyle: TextStyles.text16.copyWith(),
                  )),
                ),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.primary),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: const Color(ColorCode.primary), width: 2.w)),
              ),
            ]),
          ),
        ),
      );
      change(false, status: RxStatus.success());
    }).catchError((e) {
      if(e is DioError){
        print(e.response?.data);
      }

      change(false, status: RxStatus.error(e.toString()));
      throw e;
    });
  }
  Future individualGameSubscribe() async {
    print('indi register');
    change(false, status: RxStatus.loading());
    FormData formData = FormData.fromMap({
      "game_id": id,
      "full_name": fullNameController.text,
      "birth_date": birthDateController.text,
      "birth_place": birthPlaceController.text,
      "nationality": nationalityController.text,
      "qualification": qualificationsController.text,
      "address": addressController.text,
      "region": regionController.text,
      "school": schoolController.text,
      "phone": phoneController.text,
      "father_phone": fatherPhoneController.text,
      "email": emailController.text,
      "experience": experienceController.text,
      "personal_id":
      await MultipartFile.fromFile(imageId!.path, filename: imageId!.name),
      "personal_image": await MultipartFile.fromFile(imagePersonal!.path,
          filename: imagePersonal!.name),
    });
    await DioHelper.postData(url: 'individual_games/reserve', data: formData)
        .then((value) {
      Get.dialog(
        AlertDialog(
          content: Container(
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
            height: 365.h,
            width: 315.w,
            child: Column(children: [
              Image(
                image: AppAssets.Vector,
                height: 114.h,
                width: 114.w,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomText(
                'تم التسجيل',
                textStyle: TextStyles.text16.copyWith(
                  color: const Color(ColorCode.primary),
                  fontSize: 18,
                ),
              ),
              CustomText(
                'سيتم التواصل معكم قريباً',
                textStyle: TextStyles.text16.copyWith(
                    color: const Color(ColorCode.grey),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              CustomButtonContainer(
                InkWell(
                  onTap: () {
                    Get.offAll(() => const MainScreenView(),
                        binding: MainViewBinding());
                    Get.find<MainViewController>().navIndex.value = 2;

                    Get.find<MainViewController>().navController.value =
                        PersistentTabController(initialIndex: 2);
                  },
                  child: Center(
                      child: CustomText(
                        'عودة إلى الرئيسية',
                        textStyle: TextStyles.text16.copyWith(),
                      )),
                ),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.primary),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: const Color(ColorCode.primary), width: 2.w)),
              ),
            ]),
          ),
        ),
      );
      change(false, status: RxStatus.success());
    }).catchError((e) {
      if(e is DioError){
        print(e.response?.data);
      }

      change(false, status: RxStatus.error(e.toString()));
      throw e;
    });
  }
  Future teamGameSubscribe() async {
    print('team register');
    change(false, status: RxStatus.loading());
    FormData formData = FormData.fromMap({
      "game_id": id,
      "full_name": fullNameController.text,
      "birth_date": birthDateController.text,
      "birth_place": birthPlaceController.text,
      "nationality": nationalityController.text,
      "qualification": qualificationsController.text,
      "address": addressController.text,
      "region": regionController.text,
      "school": schoolController.text,
      "phone": phoneController.text,
      "father_phone": fatherPhoneController.text,
      "email": emailController.text,
      "experience": experienceController.text,
      "personal_id":
      await MultipartFile.fromFile(imageId!.path, filename: imageId!.name),
      "personal_image": await MultipartFile.fromFile(imagePersonal!.path,
          filename: imagePersonal!.name),
    });
    await DioHelper.postData(url: 'team_games/reserve', data: formData)
        .then((value) {
      Get.dialog(
        AlertDialog(
          content: Container(
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
            height: 365.h,
            width: 315.w,
            child: Column(children: [
              Image(
                image: AppAssets.Vector,
                height: 114.h,
                width: 114.w,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomText(
                'تم التسجيل',
                textStyle: TextStyles.text16.copyWith(
                  color: const Color(ColorCode.primary),
                  fontSize: 18,
                ),
              ),
              CustomText(
                'سيتم التواصل معكم قريباً',
                textStyle: TextStyles.text16.copyWith(
                    color: const Color(ColorCode.grey),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              CustomButtonContainer(
                InkWell(
                  onTap: () {
                    Get.offAll(() => const MainScreenView(),
                        binding: MainViewBinding());
                    Get.find<MainViewController>().navIndex.value = 2;

                    Get.find<MainViewController>().navController.value =
                        PersistentTabController(initialIndex: 2);
                  },
                  child: Center(
                      child: CustomText(
                        'عودة إلى الرئيسية',
                        textStyle: TextStyles.text16.copyWith(),
                      )),
                ),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.primary),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: const Color(ColorCode.primary), width: 2.w)),
              ),
            ]),
          ),
        ),
      );
      change(false, status: RxStatus.success());
    }).catchError((e) {
      if(e is DioError){
        print(e.response?.data);
      }

      change(false, status: RxStatus.error(e.toString()));
      throw e;
    });
  }

  @override
  void onInit() {
    id = Get.arguments[0];
    toRegisterGame = Get.arguments[1];
    teamGame = Get.arguments[2];
    change(false, status: RxStatus.success());
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
