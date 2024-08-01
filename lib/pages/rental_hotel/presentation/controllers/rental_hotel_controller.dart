import 'package:dio/dio.dart';
import 'package:example_structure/models/all_facilities_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
class RentalHotelController extends SuperController<dynamic> {
  int? id;
  RxBool isLoading = false.obs;
  int? selectedFeature;
  Rx<int> singleRoomCount = 0.obs;
  Rx<int> doubleRoomCount = 0.obs;
  Rx<int> tripleRoomCount = 0.obs;
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String? city;
  Rx<FacilityData> facility = FacilityData().obs;
  var fromDateController = TextEditingController();
  var toDateController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var notesController = TextEditingController();
  var emailController = TextEditingController();
  var periodController = TextEditingController();
  var gameController = TextEditingController();
  var numOfPersonController = TextEditingController();
  var numOfSingleRoomController = TextEditingController();
  var numOfDoubleRoomController = TextEditingController();
  var numOfTripleRoomController = TextEditingController();

  // Future fetchData() async {
  //   await DioHelper.getData(url: 'invest/facility/$id')
  //       .then((value) {
  //         print(value.data);
  //         facility.value = FacilityData.fromJson(value.data['data']);
  //         print(facility.value.id);
  //       })
  //       .catchError((e) {
  //         print(e.toString());
  //   });
  // }
  Future rentHotel() async {
    isLoading.value = true;
    print(fromDateController.text);
    await DioHelper.postData(url: 'invest/hotel/reserve/3', data: {
      "team_name": nameController.text,
      "sport": gameController.text,
      "country": city,
      "team_count": numOfPersonController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "single_rooms_count": "${singleRoomCount.value}",
      "double_rooms_count": "${doubleRoomCount.value}",
      "trible_rooms_count": "${tripleRoomCount.value}",
      "date_from": fromDateController.text,
      "date_to": toDateController.text,
      "notes": notesController.text,

    }).then((value) {
     isLoading.value = false;
      Get.dialog(
        AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r)),
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
                    Get.find<MainViewController>()
                        .navIndex
                        .value = 2;

                    Get.find<MainViewController>()
                            .navController
                            .value =
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
                        color: const Color(ColorCode.primary),
                        width: 2.w)),
              ),
            ]),
          ),
        ),
      );
    }).catchError((e) {
      isLoading.value = false;
    if(e is DioError){
      print(e.response?.data);
    }
    });
  }

  Future rentFacility() async {
    isLoading.value = true;
    print(fromDateController.text);
    await DioHelper.postData(url: 'invest/facility/reserve/$id', data: {
      "name":nameController.text,
      "email":emailController.text,
      "phone":phoneController.text,
      "date":fromDateController.text,
      "time_from":"05:00 pm",
      "duration":periodController.text,
      "notes":notesController.text

    }).then((value) {
      isLoading.value = false;
      Get.dialog(
        AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r)),
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
                    Get.find<MainViewController>()
                        .navIndex
                        .value = 2;

                    Get.find<MainViewController>()
                        .navController
                        .value =
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
                        color: const Color(ColorCode.primary),
                        width: 2.w)),
              ),
            ]),
          ),
        ),
      );
    }).catchError((e) {
      isLoading.value = false;
      if(e is DioError){
        print(e.response?.data);
      }
    });
  }

  @override
  void onInit() async {

    id = Get.arguments;

    // await fetchData();

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
