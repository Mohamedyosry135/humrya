import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/pages/book_ticket/presentation/controllers/book_ticket_controller.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class BookTicketView extends GetView<BookTicketController> {
  var adultController = TextEditingController();
  var childController = TextEditingController();

  BookTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: HomeAppBar(
        height: 120.h,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 33.0.h, left: 30.w, right: 30.w, top: 66.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: SvgPicture.asset(AppSVGAssets.back),
              ),
              CustomText(
                'حجز تذكرة',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                height: 78.h,
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.white),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'نادي ${controller.match!.host?.title}',
                          textStyle: TextStyles.text11.copyWith(
                              color: const Color(0xff2B2B2B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        CustomText(
                          'الإمارات',
                          textStyle: TextStyles.text11.copyWith(
                              color: const Color(0xff2B2B2B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: controller.match!.host?.logo ?? '',
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                      key: UniqueKey(),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: controller.match!.guest?.logo ?? '',
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                      key: UniqueKey(),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          'نادي ${controller.match!.guest?.title}',
                          textStyle: TextStyles.text11.copyWith(
                              color: const Color(0xff2B2B2B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        CustomText(
                          'الإمارات',
                          textStyle: TextStyles.text11.copyWith(
                              color: const Color(0xff2B2B2B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isHost.value = !controller.isHost.value;
                      },
                      child: Container(
                        height: 42,
                        width: 153.w,
                        decoration: BoxDecoration(
                            color: controller.isHost.value == true
                                ? const Color(ColorCode.primary)
                                : const Color(ColorCode.white),
                            border: Border.all(
                                color: const Color(
                                  ColorCode.primary,
                                ),
                                width: 1.w),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: CustomText(
                            'المضيف',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: controller.isHost.value == false
                                    ? const Color(ColorCode.primary)
                                    : const Color(ColorCode.white)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isHost.value = !controller.isHost.value;
                      },
                      child: Container(
                        height: 42,
                        width: 153.w,
                        decoration: BoxDecoration(
                            color: controller.isHost.value == false
                                ? const Color(ColorCode.primary)
                                : const Color(ColorCode.white),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(
                                  ColorCode.primary,
                                ),
                                width: 1.w)),
                        child: Center(
                          child: CustomText(
                            'الضيف',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: controller.isHost.value == true
                                    ? const Color(ColorCode.primary)
                                    : const Color(ColorCode.white)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                'التاريخ',
                textStyle: TextStyles.text11.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff595959)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border:
                        Border.all(color: const Color(0xffD7D7D7), width: 1.w)),
                child: CustomText(
                  '${controller.match!.date}  ${controller.match!.time}  ',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff646464)),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                'عدد الحضور',
                textStyle: TextStyles.text11.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff595959)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
                    width: 153.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: const Color(0xffD7D7D7), width: 1.w)),
                    child: Center(
                      child: TextFormField(
                        controller: adultController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'عدد البالغين',
                          hintStyle: TextStyles.text16.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffB7B7B7)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
                    width: 153.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: const Color(0xffD7D7D7), width: 1.w)),
                    child: Center(
                      child: TextFormField(
                        controller: childController,   keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'عدد الأطفال',
                          hintStyle: TextStyles.text16.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffB7B7B7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                'ارفاق الصورة الشخصية',
                textStyle: TextStyles.text11.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff595959)),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  ImagePicker picker = ImagePicker();
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () async {
                              controller.imageId = await picker.pickImage(
                                  source: ImageSource.camera);
                              controller.update();
                              Get.back();
                            },
                            child: Text('Camera'.tr,
                                style: const TextStyle(
                                    color: Color(ColorCode.primary),
                                    fontSize: 18))),
                        TextButton(
                            onPressed: () async {
                              controller.imageId = await picker.pickImage(
                                  source: ImageSource.gallery);
                              controller.update();
                              Get.back();
                            },
                            child: Text(
                              'Gallery'.tr,
                              style: const TextStyle(
                                  color: Color(ColorCode.primary),
                                  fontSize: 18),
                            )),
                      ],
                    ),
                  ));
                },
                child: GetBuilder<BookTicketController>(
                  builder: (snap) => Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: const Color(0xffD7D7D7), width: 1.w)),
                    child: Row(
                      children: [
                        Image(
                          image: AppAssets.capture,
                          height: 18.h,
                          width: 18.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'ارفاق الصورة',
                              textStyle: TextStyles.text11.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff646464)),
                            ),
                            CustomText(
                              '20 MB max size ( JPEG , PDF , PNG )',
                              textStyle: TextStyles.text11.copyWith(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff939393)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (controller.imageId != null)
                          Image.file(
                            File(controller.imageId!.path),
                          ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              controller.obx(
                  (snap) =>  InkWell(
                  onTap: () async {
                    if (GetStorage().read(StorageKeys.token) == null) {
                      ToastWidget().showToast(context,
                          message: 'برجاء تسجيل الدخول اولا',
                          type: ToastTypes.error);
                    } else if (
                        adultController.text.isNotEmpty &&
                        controller.imageId != null) {
                      FormData formData = FormData.fromMap({
                        "adults": adultController.text,
                        "childrens":childController.text.isNotEmpty? childController.text : 0,
                        "club_id": controller.isHost.value == true
                            ? controller.match!.host?.id
                            : controller.match!.guest?.id,
                        "green_card": await MultipartFile.fromFile(
                            controller.imageId!.path,
                            filename: controller.imageId!.name),
                      });

                      controller.bookTicket(formData: formData, context: context);
                    } else {

                      if (adultController.text.isEmpty) {
                        ToastWidget().showToast(context,
                            message: 'برجاء ادخال عدد البالغين ',
                            type: ToastTypes.error);
                      }
                      if (controller.imageId == null) {
                        ToastWidget().showToast(context,
                            message: 'برجاء اختيار صوره المرور الاخضر',
                            type: ToastTypes.error);
                      }
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 42.h,
                      width: 251.w,
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.primary),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                          child: CustomText(
                        'حجز',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 14.sp, color: const Color(ColorCode.white)),
                      )),
                    ),
                  ),
                ),
                onLoading: const Center(
                  child: SpinKitCircle(color: Color(ColorCode.primary),),
                )
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  // PersistentNavBarNavigator.pushNewScreen(
                  //   context,
                  //   screen: const BookTicketView(),
                  //   withNavBar: true, // OPTIONAL VALUE. True by default.
                  //   pageTransitionAnimation:
                  //   PageTransitionAnimation.fade,
                  // );
                  // Get.find<MainViewController>().navController.value =
                  //     PersistentTabController(initialIndex: 2);
                  // Get.find<MainViewController>().navIndex.value = 2;
                },
                child: Center(
                  child: Container(
                    height: 42.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.white),
                        border: Border.all(
                            color: const Color(ColorCode.primary), width: 1.w),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                        child: CustomText(
                      'حفظ البيانات',
                      textStyle: TextStyles.text16.copyWith(
                          fontSize: 14.sp,
                          color: const Color(ColorCode.primary)),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
