import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/my_setting/presentation/controllers/my_setting_controller.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_button.dart';
import 'package:example_structure/widgets/custom_button_container.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/custom_text_form_field.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MySettingScreen extends GetView<MySettingController> {
  Widget? backwadget;
  var formKey = GlobalKey<FormState>();
  var formKeyForChangePass = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var secondNameController  = TextEditingController();
  var oldPassController  = TextEditingController();
  var newPassController  = TextEditingController();
  var confirmNewPassController  = TextEditingController();

  MySettingScreen({Key? key, this.backwadget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: HomeAppBar(
          height: 120.h,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 30.0.h, left: 30.w, right: 30.w, top: 66.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: SvgPicture.asset(AppSVGAssets.back),
                ),
                CustomText(
                  'الضبـــــــــط',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(ColorCode.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                        color: const Color(0xff7E1337).withOpacity(0.08)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 16),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'الاسم ',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            '${controller.firstName} ${controller.lastName}',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(ColorCode.grey2)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: 'تغيير الاسم',
                              content: SizedBox(

                                width: 1.sw,
                                child: Material(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomTextFormField(
                                                    hint: controller.firstName ?? '',
                                                    controller: firstNameController,
                                                    onSave: (v) {},
                                                    style: TextStyles.text16.copyWith(
                                                      color: const Color(ColorCode.black),
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 16.sp,
                                                    ),

                                                    validator: (v){
                                                      if(v!.isEmpty){
                                                        return 'برجاء ملئ البيانات';
                                                      }
                                                      return null;
                                                    },
                                                    inputType:
                                                        TextInputType.text)),
                                            Expanded(
                                                child: CustomTextFormField(
                                                    hint: controller.lastName ?? '',
                                                    controller: secondNameController,
                                                    validator: (v){
                                                      if(v!.isEmpty){
                                                        return 'برجاء ملئ البيانات';
                                                      }
                                                      return null;
                                                    },
                                                    style: TextStyles.text16.copyWith(
                                                      color: const Color(ColorCode.black),
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 16.sp,
                                                    ),
                                                    onSave: (v) {},
                                                    inputType:
                                                        TextInputType.text)),
                                          ],
                                        ),
                                        SizedBox(height: 20.h,),
                                        Obx(
                                          () => CustomButtonContainer(
                                              Center(
                                                  child: CustomButton(
                                                Center(
                                                    child: controller.isLoading.value == false ?  Text(
                                                  'تعديل',
                                                  style: TextStyles.text16
                                                      .copyWith(
                                                          color: Colors.white),
                                                ) : const SpinKitDoubleBounce(color: Colors.white,)),
                                                () {
                                                  if(formKey.currentState!.validate()){
                                                    controller.editProfileName(first: firstNameController.text, last: secondNameController.text);
                                                  }
                                                },
                                                backGroundColor:
                                                    const Color(ColorCode.primary),
                                              )),
                                              width: 100,
                                              height: 50),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        },
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'تعديل',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(ColorCode.grey2).withOpacity(0.10)),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'رقم الهاتف ',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            controller.phone ?? '',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(ColorCode.grey2)),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Align(
                      //     alignment: AlignmentDirectional.centerStart,
                      //     child: CustomText(
                      //       'تعديل',
                      //       textAlign: TextAlign.center,
                      //       textStyle: TextStyles.text22.copyWith(
                      //           fontSize: 12.sp,
                      //           fontWeight: FontWeight.w600,
                      //           color: Color(ColorCode.primary),
                      //           decoration: TextDecoration.underline),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(ColorCode.grey2).withOpacity(0.10)),
                  const SizedBox(
                    height: 24,
                  ),



                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'اللغة ',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'العربية',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(ColorCode.grey2)),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Align(
                      //     alignment: AlignmentDirectional.centerStart,
                      //     child: CustomText(
                      //       'تغيير',
                      //       textAlign: TextAlign.center,
                      //       textStyle: TextStyles.text22.copyWith(
                      //           fontSize: 12.sp,
                      //           fontWeight: FontWeight.w600,
                      //           color: Color(ColorCode.primary),
                      //           decoration: TextDecoration.underline),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(ColorCode.grey2).withOpacity(0.10)),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'كلمة السر ',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            '*********',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(ColorCode.grey2)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: 'تغيير كلمو السر',
                              content: SizedBox(

                                width: 1.sw,
                                child: Material(
                                  child: Form(
                                    key: formKeyForChangePass,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CustomTextFormField(
                                            hint: 'كلمة السر القديمه',
                                            controller: oldPassController,
                                            onSave: (v) {},
                                            style: TextStyles.text16.copyWith(
                                              color: const Color(ColorCode.black),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.sp,
                                            ),

                                            validator: (v){
                                              if(v!.length < 8){
                                                return 'برجاء ملئ البيانات';
                                              }
                                              return null;
                                            },
                                            inputType:
                                            TextInputType.text),
                                        SizedBox(height: 25.h,),
                                        CustomTextFormField(
                                            hint: 'كلمة السر الجديدة',
                                            controller: newPassController,
                                            onSave: (v) {},
                                            style: TextStyles.text16.copyWith(
                                              color: const Color(ColorCode.black),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.sp,
                                            ),

                                            validator: (v){
                                              if(v!.length < 8){
                                                return 'برجاء ملئ البيانات';
                                              }
                                              return null;
                                            },
                                            inputType:
                                            TextInputType.text),   SizedBox(height: 25.h,),
                                        CustomTextFormField(
                                            hint: 'تأكيد كلمة السر الجديدة',
                                            controller: confirmNewPassController,
                                            onSave: (v) {},
                                            style: TextStyles.text16.copyWith(
                                              color: const Color(ColorCode.black),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.sp,
                                            ),

                                            validator: (v){
                                              if(v!.length < 8){
                                                return 'برجاء ملئ البيانات';
                                              }else if (v != newPassController.text){
                                                return 'كلمه السر غير متطابقه';
                                              }
                                              return null;
                                            },
                                            inputType:
                                            TextInputType.text),
                                        SizedBox(height: 20.h,),
                                        Obx(
                                              () => CustomButtonContainer(
                                              Center(
                                                  child: CustomButton(
                                                    Center(
                                                        child: controller.isLoading.value == false ?  Text(
                                                          'تعديل',
                                                          style: TextStyles.text16
                                                              .copyWith(
                                                              color: Colors.white),
                                                        ) : const SpinKitDoubleBounce(color: Colors.white,)),
                                                        () {
                                                      if(formKeyForChangePass.currentState!.validate()){
                                                        controller.editPassword(oldPass: oldPassController.text, newPass: newPassController.text, confirmPass: confirmNewPassController.text);
                                                      }
                                                    },
                                                    backGroundColor:
                                                    const Color(ColorCode.primary),
                                                  )),
                                              width: 100,
                                              height: 50),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        },
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomText(
                            'تغيير',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(ColorCode.primary),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
