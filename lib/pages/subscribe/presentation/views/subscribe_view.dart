import 'package:example_structure/pages/subscribe/presentation/controllers/subscribe_controller.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/home_appbar.dart';

class SubscribeView extends GetView<SubscribeController> {
  String? title;
  int id;
  SubscribeView({Key? key, required this.title, required this.id})
      : super(key: key);
  var formKey = GlobalKey<FormState>();

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
                '$title',
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
        padding: EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 22.w),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'الإسم كاملا',
                      fillColor: Colors.white,
                      border: false,
                      controller: controller.fullNameController,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                    onTap: (){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1990),
                          maxTime: DateTime(2025), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {

                            controller.birthDateController.text =
                                DateFormat('dd-MM-yyyy').format(date);
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(0, 0),
                            color: const Color(0xff7E1337).withOpacity(0.08))
                      ]),
                      child: IgnorePointer(
                        ignoring: true,
                        child: CustomTextFormField(
                          hint: 'تاريخ الميلاد',
                          fillColor: Colors.white,
                          border: false,
                          onSave: (e) {},
                          controller: controller.birthDateController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'يجب ملئ البيانات';
                            }
                            return null;
                          },
                          style: TextStyles.text16.copyWith(
                            color: const Color(ColorCode.black),
                            fontWeight: FontWeight.normal,
                            fontSize: 16.sp,
                          ),
                          inputType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'مكان الميلاد',
                      fillColor: Colors.white,
                      border: false,
                      controller: controller.birthPlaceController,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'الجنسية',
                      fillColor: Colors.white,
                      border: false,
                      controller: controller.nationalityController,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'المؤهل الدراسي',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.qualificationsController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'العنوان بالتفصيل',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.addressController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'المنطقة',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.regionController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'المدرسة / جهة العمل',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.schoolController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'الخبره (سنه)',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.experienceController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'رقم الهاتف',
                      fillColor: Colors.white,
                      controller: controller.phoneController,
                      border: false,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        } else if (v.length < 10) {
                          return 'رقم الهاتف غير صحيح';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'رقم هاتف ولي الأمر',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.fatherPhoneController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        } else if (v.length < 10) {
                          return 'رقم الهاتف غير صحيح';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, 0),
                          color: const Color(0xff7E1337).withOpacity(0.08))
                    ]),
                    child: CustomTextFormField(
                      hint: 'البريد الالكتروني ',
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      controller: controller.emailController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يجب ملئ البيانات';
                        } else if (!v.contains('@')) {
                          return 'البريد الالكتروني خطا';
                        }
                        return null;
                      },
                      style: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.black),
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GetBuilder(
                    builder: (SubscribeController snap) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            ImagePicker picker = ImagePicker();
                            Get.bottomSheet(Container(
                              color: Colors.white,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        controller.imageId =
                                            await picker.pickImage(
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
                                        controller.imageId =
                                            await picker.pickImage(
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
                          child: Container(
                            height: 50.h,
                            width: 153.w,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: controller.imageId == null
                                        ? const Color(ColorCode.primary)
                                        : Colors.green,
                                    width: 1.w)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  'ارفق الهوية',
                                  textStyle: TextStyles.text11.copyWith(
                                      fontSize: 12.sp,
                                      color: const Color(0xff979797),
                                      height: 1,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                SvgPicture.asset(AppSVGAssets.attach)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ImagePicker picker = ImagePicker();
                            Get.bottomSheet(Container(
                              color: Colors.white,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        controller.imagePersonal =
                                            await picker.pickImage(
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
                                        controller.imagePersonal =
                                            await picker.pickImage(
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
                          child: Container(
                            height: 50.h,
                            width: 153.w,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: controller.imagePersonal == null
                                        ? const Color(ColorCode.primary)
                                        : Colors.green,
                                    width: 1.w)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  'ارفق الصورة الشخصية',
                                  textStyle: TextStyles.text11.copyWith(
                                      fontSize: 12.sp,
                                      color: const Color(0xff979797),
                                      height: 1,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                SvgPicture.asset(AppSVGAssets.attach)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {

                     if(controller.toRegisterGame == true){
                       if (formKey.currentState!.validate() &&
                           controller.imagePersonal != null &&
                           controller.imageId != null) {
                        if(controller.teamGame == true){
                          controller.teamGameSubscribe();
                        }else{
                          controller.individualGameSubscribe();
                        }
                       } else if (controller.imageId == null) {
                         ToastWidget().showToast(context,
                             message: 'يجب ارفاق صوره الهوية',
                             type: ToastTypes.info);
                       }else if (controller.imagePersonal == null ){
                         ToastWidget().showToast(context,
                             message: 'يجب ارفاق الصورة الشخصية ',
                             type: ToastTypes.info);
                       }
                     }else{
                       if (formKey.currentState!.validate() &&
                           controller.imagePersonal != null &&
                           controller.imageId != null) {
                         controller.sendSubscription();
                       } else if (controller.imageId == null) {
                         ToastWidget().showToast(context,
                             message: 'يجب ارفاق صوره الهوية',
                             type: ToastTypes.info);
                       }else if (controller.imagePersonal == null ){
                         ToastWidget().showToast(context,
                             message: 'يجب ارفاق الصورة الشخصية ',
                             type: ToastTypes.info);
                       }
                     }
                    },
                    child: CustomButtonContainer(
                      Center(
                          child: controller.obx(
                            (snap) => CustomText(
                        'سجل الان',
                        textStyle: TextStyles.text16.copyWith(
                            color: const Color(ColorCode.white),
                        ),
                      ),
                            onLoading: const SpinKitDualRing(color: Colors.white)
                          )),
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color(ColorCode.primary),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

// class done extends GetView<SubscribeController> {
//
//   done({Key? key,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(height: 40,),
//       Image(
//         image: AppAssets.vector,
//         height: 114.h,
//         width: 114.w,
//       ),
//
//     ],);
//   }
// }
