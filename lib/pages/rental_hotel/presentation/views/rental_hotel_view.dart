import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/rental_hotel/presentation/controllers/rental_hotel_controller.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_button_container.dart';
import 'package:example_structure/widgets/custom_drop_down_widget.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/custom_text_form_field.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RentalHotelView extends GetView<RentalHotelController> {
  bool isHotel;
  String name;
  String image;
  RentalHotelView(
      {Key? key,
      required this.isHotel,
      required this.name,
      required this.image})
      : super(key: key);
  List albumsPhotos = [
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
    AppAssets.hotel,
  ];

  List<String> CITYitems = ['الدولة', 'الامارات', 'egypt'];
  String selectedCITY = 'الدولة';

  List<String> Individuallyitems = [
    'فردي',
    'egypt',
  ];
  String Individually = 'فردي';

  List<String> tripleitems = [
    'ثلاثي',
    'egypt',
  ];
  String triple = 'ثلاثي';

  List<String> dupleitems = [
    'زوجي',
    'egypt',
  ];
  String duple = 'زوجي';
  var formKey = GlobalKey<FormState>();

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
                name,
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
        padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    height: 210.h,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsetsDirectional.only(bottom: 16),
                          height: 210.h,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(15.r),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButtonContainer(
                            Center(
                                child: CustomText(
                              'احجز الان',
                              textStyle: TextStyles.text16.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.white),
                              ),
                            )),
                            width: 120.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: const Color(ColorCode.primary),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      hint:
                          isHotel == true ? 'اسم الفريق' : 'اسم الجهه / الشخص',
                      controller: controller.nameController,
                      fillColor: Colors.white,
                      border: false,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'برجاء ملي البيانات';
                        }
                        return null;
                      },
                      inputType: TextInputType.text,
                    ),
                  ),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(0, 0),
                            color: const Color(0xff7E1337).withOpacity(0.08))
                      ]),
                      child: CustomTextFormField(
                        hint: 'اللعبة',
                        fillColor: Colors.white,
                        controller: controller.gameController,
                        border: false,
                        onSave: (e) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'برجاء ملي البيانات';
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                      ),
                    ),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    GetBuilder<RentalHotelController>(
                      builder: (snap) => CustomDropDownWidget<String>(
                          title: selectedCITY,
                          textStyles: TextStyles.text22.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff979797)),
                          value: selectedCITY,
                          items: CITYitems,
                          onChange: (String? val) {
                            selectedCITY = val.toString();
                            controller.city = val.toString();
                            controller.update();
                          }),
                    ),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(0, 0),
                            color: const Color(0xff7E1337).withOpacity(0.08))
                      ]),
                      child: CustomTextFormField(
                        hint: 'عدد اأفراد',
                        fillColor: Colors.white,
                        border: false,
                        controller: controller.numOfPersonController,
                        onSave: (e) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'برجاء ملي البيانات';
                          }
                          return null;
                        },
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
                      hint: 'البريد الالكتروني',
                      fillColor: Colors.white,
                      border: false,
                      controller: controller.emailController,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'برجاء ملي البيانات';
                        } else if (!v.toString().contains('@')) {
                          return 'البريد الالكتروني خطا';
                        }
                        return null;
                      },
                      inputType: TextInputType.emailAddress,
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
                      border: false,
                      controller: controller.phoneController,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'برجاء ملي البيانات';
                        } else if (v.toString().length < 10) {
                          return 'رقم الهاتف غير صحيح';
                        }
                        return null;
                      },
                      inputType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  if (isHotel == false)
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2023),
                            maxTime: DateTime(2025),
                            onChanged: (date) {}, onConfirm: (date) {
                          controller.fromDate.value = date;
                          controller.fromDateController.text =
                              DateFormat('dd-MM-yyyy').format(date);
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 14,
                                offset: const Offset(0, 0),
                                color:
                                    const Color(0xff7E1337).withOpacity(0.08))
                          ]),
                          child: IgnorePointer(
                            ignoring: true,
                            child: CustomTextFormField(
                              hint: 'من تاريخ',
                              controller: controller.fromDateController,
                              fillColor: Colors.white,
                              border: false,
                              onSave: (e) {},
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'برجاء ملي البيانات';
                                }
                                return null;
                              },
                              inputType: TextInputType.text,
                            ),
                          )),
                    ),
                  if (isHotel == false)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == false)
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(0, 0),
                            color: const Color(0xff7E1337).withOpacity(0.08))
                      ]),
                      child: CustomTextFormField(
                        hint: 'المدة',
                        fillColor: Colors.white,
                        border: false,
                        controller: controller.periodController,
                        onSave: (e) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'برجاء ملي البيانات';
                          }
                          return null;
                        },
                        inputType: TextInputType.phone,
                      ),
                    ),
                  if (isHotel == true)
                    Row(
                      children: [
                        CustomText(
                          'عدد الغرف',
                          textStyle: TextStyles.text22.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(ColorCode.grey3)),
                        ),
                      ],
                    ),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    'فردي',
                                    textStyle: TextStyles.text13.copyWith(
                                        color: const Color(0xff979797),
                                        fontSize: 12),
                                  ),
                                  Obx(() => CustomText(
                                        controller.singleRoomCount.value
                                            .toString(),
                                        textStyle: TextStyles.text13.copyWith(
                                            color: const Color(0xff979797),
                                            fontSize: 12),
                                      )),
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.singleRoomCount.value++;
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_up)),
                                      InkWell(
                                          onTap: () {
                                            if (controller
                                                    .singleRoomCount.value >
                                                0) {
                                              controller
                                                  .singleRoomCount.value--;
                                            }
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_down)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    'زوجي',
                                    textStyle: TextStyles.text13.copyWith(
                                        color: const Color(0xff979797),
                                        fontSize: 12),
                                  ),
                                  Obx(() => CustomText(
                                        controller.doubleRoomCount.value
                                            .toString(),
                                        textStyle: TextStyles.text13.copyWith(
                                            color: const Color(0xff979797),
                                            fontSize: 12),
                                      )),
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.doubleRoomCount.value++;
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_up)),
                                      InkWell(
                                          onTap: () {
                                            if (controller
                                                    .doubleRoomCount.value >
                                                0) {
                                              controller
                                                  .doubleRoomCount.value--;
                                            }
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_down)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    'ثلاثي',
                                    textStyle: TextStyles.text13.copyWith(
                                        color: const Color(0xff979797),
                                        fontSize: 12),
                                  ),
                                  Obx(() => CustomText(
                                        controller.tripleRoomCount.value
                                            .toString(),
                                        textStyle: TextStyles.text13.copyWith(
                                            color: const Color(0xff979797),
                                            fontSize: 12),
                                      )),
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.tripleRoomCount.value++;
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_up)),
                                      InkWell(
                                          onTap: () {
                                            if (controller
                                                    .tripleRoomCount.value >
                                                0) {
                                              controller
                                                  .tripleRoomCount.value--;
                                            }
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_down)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    Row(
                      children: [
                        CustomText(
                          'موعد الحجز',
                          textStyle: TextStyles.text22.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(ColorCode.grey3)),
                        ),
                      ],
                    ),
                  if (isHotel == true)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (isHotel == true)
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2023),
                                  maxTime: DateTime(2025),
                                  onChanged: (date) {}, onConfirm: (date) {
                                controller.fromDate.value = date;
                                controller.fromDateController.text =
                                    DateFormat('dd-MM-yyyy').format(date);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 14,
                                      offset: const Offset(0, 0),
                                      color: const Color(0xff7E1337)
                                          .withOpacity(0.08))
                                ]),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: const Color(ColorCode.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsetsDirectional.only(top: 4),
                                        child: Image(
                                            image: AppAssets.date,
                                            width: 12,
                                            height: 12,
                                            fit: BoxFit.fill),
                                      ),
                                      Expanded(
                                        child: IgnorePointer(
                                          ignoring: true,
                                          child: CustomTextFormField(
                                            hint: 'من تاريخ',
                                            controller:
                                                controller.fromDateController,
                                            fillColor: Colors.white,
                                            border: false,
                                            validator: (v) {
                                              if (v!.isEmpty) {
                                                return 'برجاء ملي البيانات';
                                              }
                                              return null;
                                            },
                                            onSave: (e) {},
                                            inputType: TextInputType.text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2023),
                                  maxTime: DateTime(2025),
                                  onChanged: (date) {}, onConfirm: (date) {
                                controller.toDate.value = date;
                                controller.toDateController.text =
                                    DateFormat('dd-MM-yyyy').format(date);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 14,
                                      offset: const Offset(0, 0),
                                      color: const Color(0xff7E1337)
                                          .withOpacity(0.08))
                                ]),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: const Color(ColorCode.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsetsDirectional.only(top: 4),
                                        child: Image(
                                            image: AppAssets.date,
                                            width: 12,
                                            height: 12,
                                            fit: BoxFit.fill),
                                      ),
                                      Expanded(
                                        child: IgnorePointer(
                                          ignoring: true,
                                          child: CustomTextFormField(
                                            hint: 'إلى تاريخ',
                                            fillColor: Colors.white,
                                            controller:
                                                controller.toDateController,
                                            border: false,
                                            validator: (v) {
                                              if (v!.isEmpty) {
                                                return 'برجاء ملي البيانات';
                                              }
                                              return null;
                                            },
                                            onSave: (e) {},
                                            inputType: TextInputType.text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 10.h,
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
                      hint: 'ملاحظات',
                      fillColor: Colors.white,
                      border: false,
                      controller: controller.notesController,
                      maxLines: 5,
                      onSave: (e) {},
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'برجاء ملي البيانات';
                        }
                        return null;
                      },
                      inputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  if (isHotel == true)
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate() &&
                            (controller.singleRoomCount.value != 0 ||
                                controller.doubleRoomCount.value != 0 ||
                                controller.tripleRoomCount.value != 0) &&
                            controller.city != null) {
                          controller.rentHotel();
                        } else if (controller.city == null) {
                          ToastWidget().showToast(context,
                              message: 'يجب اختيار الدوله',
                              type: ToastTypes.error);
                        } else if (controller.tripleRoomCount.value == 0 &&
                            controller.singleRoomCount.value == 0 &&
                            controller.doubleRoomCount.value == 0) {
                          ToastWidget().showToast(context,
                              message: 'يجب اختيار عدد الغرف',
                              type: ToastTypes.error);
                        }
                      },
                      child: Obx(
                        () => CustomButtonContainer(
                          Center(
                              child: controller.isLoading.value == false
                                  ? CustomText(
                                      'احجز الان',
                                      textStyle: TextStyles.text16.copyWith(
                                        color: const Color(ColorCode.white),
                                      ),
                                    )
                                  : const SpinKitDualRing(
                                      color: Color(ColorCode.white))),
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.primary),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  if (isHotel == false)
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.rentFacility();
                        }
                      },
                      child: Obx(
                        () => CustomButtonContainer(
                          Center(
                              child: controller.isLoading.value == false
                                  ? CustomText(
                                      'احجز الان',
                                      textStyle: TextStyles.text16.copyWith(
                                        color: const Color(ColorCode.white),
                                      ),
                                    )
                                  : const SpinKitDualRing(
                                      color: Color(ColorCode.white))),
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.primary),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CustomText(
                    '* هذه الاستمارة لا تعني اتمام عملية الحجز، وانما هي مجرد طلب، وسيتم التواصل معكم في أقرب وقت من قبل مسئولي فندق النادي.',
                    textStyle: TextStyles.text16.copyWith(
                      color: const Color(ColorCode.black).withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
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
