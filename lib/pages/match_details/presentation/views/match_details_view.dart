import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/pages/book_ticket/bindings/book_ticket_binding.dart';
import 'package:example_structure/pages/book_ticket/presentation/views/book_ticket_view.dart';
import 'package:example_structure/pages/match_details/presentation/controllers/match_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class MatchDetailsView extends GetView<MatchDetailsController> {
  CountdownTimerController? timerController;

  MatchDetailsView({super.key});
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
                'تفاصيل المباراة',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                  height: 486.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(ColorCode.white),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Image(
                        image: AppAssets.stadiumSmall2,
                        height: 27.h,
                        width: 34.w,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        '${controller.match!.stadioum}',
                        textStyle: TextStyles.text16
                            .copyWith(color: const Color(0xff535353)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        '${controller.match!.date}',
                        textStyle: TextStyles.text11.copyWith(
                            color: const Color(0xff2B2B2B),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.match!.host?.logo ?? '',
                                height: 66.h,
                                width: 66.w,
                                key: UniqueKey(),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              CustomText(
                                'نادي ${controller.match!.host?.title}',
                                textStyle: TextStyles.text16
                                    .copyWith(color: const Color(0xff2B2B2B)),
                              ),
                            ],
                          ),
                          CustomText(
                            'VS',
                            textStyle: TextStyles.text25.copyWith(
                                fontSize: 26.sp,
                                color: const Color(ColorCode.borderColor),
                                fontWeight: FontWeight.w700),
                          ),
                          Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.match!.guest?.logo ?? '',
                                height: 66.h,
                                width: 66.w,
                                key: UniqueKey(),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              CustomText(
                                'نادي ${controller.match!.guest?.title}',
                                textStyle: TextStyles.text16
                                    .copyWith(color: const Color(0xff2B2B2B)),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomText(
                        'صـافرة البداية',
                        textStyle: TextStyles.text11.copyWith(
                            color: const Color(0xff2B2B2B),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        '${controller.match!.time}',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 15.sp,
                            color: const Color(ColorCode.primary)),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 134.h,
                        width: double.infinity,
                        padding:
                            EdgeInsets.only(left: 39.w, right: 39.w, top: 21.h),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff4B0B20),
                                  Color(0xff7E1337),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              'متبقي على بداية المباراة',
                              textStyle: TextStyles.text16.copyWith(
                                  color: const Color(ColorCode.white)),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: CountdownTimer(
                                endTime: controller.endTime,
                                onEnd: () {
                                  controller.isResend.value = true;
                                },
                                controller: timerController,
                                widgetBuilder:
                                    (context, CurrentRemainingTime? time) {
                                  if (time == null) {
                                    return const Text('00:00',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ));
                                  }
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${time.days ?? '00'}',
                                            style: TextStyles.text25.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(
                                                    ColorCode.white)),
                                          ),
                                          CustomText(
                                            'يوم',
                                            textStyle: TextStyles.text16
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: const Color(
                                                        ColorCode.white),
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${time.hours}',
                                            style: TextStyles.text25.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(
                                                    ColorCode.white)),
                                          ),
                                          CustomText(
                                            'ساعه    ',
                                            textStyle: TextStyles.text16
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: const Color(
                                                        ColorCode.white),
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${time.min ?? '00'}',
                                            style: TextStyles.text25.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(
                                                    ColorCode.white)),
                                          ),
                                          CustomText(
                                            'دقيقة',
                                            textStyle: TextStyles.text16
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: const Color(
                                                        ColorCode.white),
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${time.sec}',
                                            style: TextStyles.text25.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(
                                                    ColorCode.white)),
                                          ),
                                          CustomText(
                                            'ثانية',
                                            textStyle: TextStyles.text16
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: const Color(
                                                        ColorCode.white),
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 18.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => BookTicketView(),binding: BookTicketBinding(),arguments: [controller.match]);
                },
                child: Container(
                  height: 42.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      color: const Color(ColorCode.primary),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Center(
                      child: CustomText(
                    'حجز تذكرة',
                    textStyle: TextStyles.text16.copyWith(
                        fontSize: 14.sp, color: const Color(ColorCode.white)),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
