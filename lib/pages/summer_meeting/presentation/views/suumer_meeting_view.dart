import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/pages/subscribe/bindings/subscribe_binding.dart';
import 'package:example_structure/pages/subscribe/presentation/views/subscribe_view.dart';
import 'package:example_structure/pages/summer_meeting/presentation/controllers/smmer_meet_controller.dart';
import 'package:example_structure/pages/summer_meeting/presentation/views/widgets/summer_meeting_item.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class SummerMeetingView extends GetView<SummerMeetingController> {
  String? head;
  AssetImage? backgroundImage;
  String? text;
  String? subHead;
  String? buttonText;
  bool? isSummer;
  SummerMeetingView(
      {super.key,
      this.head,
      this.backgroundImage,
      this.text,
      this.isSummer,
      this.subHead,
      this.buttonText});
  List images = [
    AppAssets.museum,
    AppAssets.museum,
    AppAssets.museum,
    AppAssets.museum,
    AppAssets.museum,
    AppAssets.museum,
    AppAssets.museum,
  ];

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
                head ?? '',
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
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 185.h,
                        width: 283.w,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: CachedNetworkImage(
                                  imageUrl: controller.image ?? '',
                                  height: 185.h,
                                  width: 283.w,
                                  fit: BoxFit.fill,
                                  key: UniqueKey(),
                                  errorWidget: (context, url, step) =>
                                      const Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      )),
                            ),
                            Container(
                              height: 185.h,
                              width: 283.w,
                              decoration: BoxDecoration(
                                  color: const Color(ColorCode.primary)
                                      .withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                              top: 0.h,
                              right: 0.w,
                              child: SizedBox(
                                height: 185.h,
                                width: 283.w,
                                child: Center(
                                  child: CustomText(
                                    head ?? '',
                                    textStyle: TextStyles.text22.copyWith(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        text ?? '',
                        textStyle: TextStyles.text11.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 2.3.h,
                            color: Colors.black),
                        maxLines: 12,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                if (controller.programs?.isNotEmpty ?? false)
                  Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            'برامج $head',
                            textAlign: TextAlign.start,
                            textStyle: TextStyles.text13.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.primary)),
                          ),
                          const Spacer()
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 92.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SummerMeetingItem(
                                controller.programs?[i].title ?? ''),
                          ),
                          itemCount: controller.programs?.length ?? 0,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                if (controller.album?.isNotEmpty ?? false)
                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, i) => ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {
                                  Get.dialog(SizedBox(
                                    height: 1.sh,
                                    width: 1.sw,
                                    child: Material(
                                      color: Colors.black.withOpacity(0.6),
                                      child: Stack(
                                        children: [
                                          PinchZoom(
                                              child: Image(
                                            image: NetworkImage(
                                                controller.album?[i] ?? ''),
                                            width: 150.w,
                                            height: 100.h,
                                            loadingBuilder:
                                                (ctx, child, event) {
                                              if (event == null) {
                                                return child;
                                              }

                                              return Center(
                                                child: SizedBox(
                                                  width: 130.w,
                                                  child: SpinKitDualRing(
                                                    color: const Color(
                                                        ColorCode.primary),
                                                    size: 30.r,
                                                  ),
                                                ),
                                              );
                                            },
                                            errorBuilder: (ctx, child, event) =>
                                                const Center(
                                              child: Icon(
                                                Icons.error_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )),
                                          Positioned(
                                            top: 20,
                                            right: 20,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                child: Image(
                                  image:
                                      NetworkImage(controller.album?[i] ?? ''),
                                  width: 150.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (ctx, child, event) {
                                    if (event == null) {
                                      return child;
                                    }

                                    return Center(
                                      child: SizedBox(
                                        width: 130.w,
                                        child: SpinKitDualRing(
                                          color: const Color(ColorCode.primary),
                                          size: 30.r,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (ctx, child, event) =>
                                      const Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (ctx, i) => SizedBox(
                              width: 12.w,
                            ),
                        itemCount: controller.album?.length ?? 0),
                  ),
                SizedBox(
                  height: 16.h,
                ),
                controller.obx(
                    (snap) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  'الأجنده',
                                  textAlign: TextAlign.start,
                                  textStyle: TextStyles.text13.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(ColorCode.primary)),
                                ),
                                const Spacer()
                              ],
                            ),
                            Center(
                              child: CustomText(
                                controller.month ?? '',
                                textStyle: TextStyles.text11.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(ColorCode.borderColor)),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            GetBuilder<SummerMeetingController>(
                                builder: (snap) => Container(
                                      padding: EdgeInsets.all(8.r),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.w),
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: TableCalendar(
                                        focusedDay: controller.focusedDay!,
                                        selectedDayPredicate: (day) {
                                          return controller.selectedDays
                                              .contains(day);
                                        },
                                        firstDay: DateTime(DateTime.now().year,
                                            controller.monthToApi!, 1),
                                        lastDay: DateTime(DateTime.now().year,
                                            controller.monthToApi!, 31),
                                        headerVisible: false,
                                        onDaySelected: controller.onDaySelected,
                                        calendarFormat: CalendarFormat.month,
                                        calendarBuilders: CalendarBuilders(
                                            selectedBuilder: (context, date,
                                                    today) =>
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                              ColorCode.primary)
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      border: Border.all(
                                                          color: const Color(
                                                              ColorCode
                                                                  .primary),
                                                          width: 2),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                              DateFormat.d()
                                                                  .format(
                                                                      date)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                        calendarStyle: CalendarStyle(
                                          isTodayHighlighted: false,
                                          markerSize: 10,
                                          markerDecoration: BoxDecoration(
                                            color:
                                                const Color(ColorCode.primary),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: const Color(
                                                    ColorCode.primary),
                                                width: 2),
                                          ),
                                          selectedTextStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          defaultTextStyle: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          holidayTextStyle: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                    onLoading: const Center(
                      child: SpinKitDancingSquare(
                        color: Color(ColorCode.primary),
                      ),
                    ),
                    onEmpty: const Center(
                      child: Text('لا يوجد انشطه'),
                    )),
                SizedBox(
                  height: 40.h,
                ),
                if (controller.hasForm != '0')
                  InkWell(
                    onTap: () {
                      Get.to(
                          () => SubscribeView(
                                title: 'اشترك في ${controller.name}',
                                id: 0,
                              ),
                          binding: SubscribeBinding());
                    },
                    child: CustomButtonContainer(
                      Center(
                          child: CustomText(
                        'اشترك في ${controller.name}',
                        textStyle: TextStyles.text16.copyWith(
                          color: const Color(ColorCode.white),
                        ),
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
            )),
      ),
    );
  }
}
