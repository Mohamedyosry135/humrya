import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/pages/ticket_details/presentaion/controller/ticket_details_controller.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
  const TicketDetailsView({Key? key}) : super(key: key);

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
                'تفاصيل التذكرة',
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

                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.white),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image(
                    //       image: AppAssets.cup,
                    //       height: 15.1.h,
                    //       width: 18.1.w,
                    //     ),
                    //     SizedBox(
                    //       width: 9.w,
                    //     ),
                    //     CustomText(
                    //       'بطولة الأندية',
                    //       textStyle: TextStyles.text11.copyWith(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xff646464)),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                controller.ticket?.matche?.host?.title ?? '',
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
                            imageUrl:
                                controller.ticket?.matche?.host?.logo ?? '',
                            height: 40.h,
                            width: 40.w,
                          ),
                          CachedNetworkImage(
                            imageUrl:
                                controller.ticket?.matche?.guest?.logo ?? '',
                            height: 40.h,
                            width: 40.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                controller.ticket?.matche?.guest?.title ?? '',
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
                      height: 35.h,
                    ),
                    Center(
                      child: CustomText(
                        'تم اصدار التذكرة الإلكترونية',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 15.sp,
                            color: const Color(ColorCode.borderColor)),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Container(
                        width: 191.w,
                        height: 1.h,
                        color: const Color(0xffE6E6E6),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              'بوابة الدخول',
                              textStyle: TextStyles.text11.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA5A5A5)),
                            ),
                            CustomText(
                              controller.ticket?.gate ?? 'لا يوجد',
                              textStyle: TextStyles.text16.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff595959)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              'الدرجة',
                              textStyle: TextStyles.text11.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA5A5A5)),
                            ),
                            CustomText(
                              controller.ticket?.level ?? 'لا يوجد',
                              textStyle: TextStyles.text16.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff595959)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              'الكود',
                              textStyle: TextStyles.text11.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA5A5A5)),
                            ),
                            CustomText(
                              controller.ticket?.code ?? 'لا يوجد',
                              textStyle: TextStyles.text16.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff595959)),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomText(
                      'التاريخ',
                      textStyle: TextStyles.text11.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffA5A5A5)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      controller.ticket?.date != null
                          ? DateFormat.yMMMMEEEEd('ar')
                              .format(DateTime.parse(controller.ticket!.date!))
                          : 'لا يوجد',
                      textStyle: TextStyles.text11.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff595959)),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Column(
                       children: [
                         CustomText(
                           'البالغين',
                           textStyle: TextStyles.text11.copyWith(
                               fontSize: 12.sp,
                               fontWeight: FontWeight.w400,
                               color: const Color(0xffA5A5A5)),
                         ),
                         SizedBox(
                           height: 8.h,
                         ),
                         CustomText(
                          controller.ticket?.adult ?? 'لا يوجد',
                           textStyle: TextStyles.text11.copyWith(
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                               color: const Color(0xff595959)),
                         ),
                       ],
                     ),
                     Column(
                       children: [
                         CustomText(
                           'الأطفال',
                           textStyle: TextStyles.text11.copyWith(
                               fontSize: 12.sp,
                               fontWeight: FontWeight.w400,
                               color: const Color(0xffA5A5A5)),
                         ),
                         SizedBox(
                           height: 8.h,
                         ),
                         CustomText(
                           controller.ticket?.childerns ?? 'لا يوجد',
                           textStyle: TextStyles.text11.copyWith(
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                               color: const Color(0xff595959)),
                         ),
                       ],
                     )
                   ],
                 ), SizedBox(
                      height: 24.h,
                    ),
                 if(controller.ticket?.qrCode != null)   Center(
                      child: Container(
                        height: 111.h,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        width: 111.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(0xffD7D7D7), width: 1.w)),
                        child: const Center(
                          child: Image(
                            image: AppAssets.qrCode,
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
              InkWell(
                onTap: () {
                  Get.offAll(const MainScreenView(),
                      binding: MainViewBinding());
                },
                child: Center(
                  child: Container(
                    height: 42.h,
                    width: 185.w,
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.primary),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                        child: CustomText(
                      'عودة إلى الرئيسية',
                      textStyle: TextStyles.text16.copyWith(
                          fontSize: 14.sp, color: const Color(ColorCode.white)),
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
