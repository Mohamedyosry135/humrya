import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/pages/cultural_center/presentation/controllers/cultural_center_controller.dart';
import 'package:example_structure/pages/cultural_center/presentation/views/widgets/container_item.dart';
import 'package:example_structure/pages/summer_meeting/bindings/summer_meeting_binding.dart';
import 'package:example_structure/pages/summer_meeting/presentation/views/suumer_meeting_view.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custm_network_image_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../../../single_new/bindings/single_new_binding.dart';
import '../../../single_new/presentation/views/single_vew_view.dart';

class CulturalCenterView extends GetView<CulturalCenterController> {
  DateTime? _selectedDay;

  CulturalCenterView({super.key});

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
                'المركز الثقافي',
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
      body: controller.obx(
          (snap) => Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 22.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            'الأخبار',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.primary)),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 170.h,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 170.h,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          color: const Color(
                                              ColorCode.borderColor),
                                          width: 1.5.w,
                                          strokeAlign: StrokeAlign.center)),
                                  child: ClipRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Stack(
                                      children: [
                                        CustomNetworkImageWidget(
                                          imageUrl: controller.cultureCenter
                                                  .value.data?.news?.image ??
                                              '',
                                          fit: BoxFit.fill,
                                          width: 1.sw * 0.9,
                                          onTap: () {
                                            Get.to(
                                                () => SingleNewView(
                                                    title: controller
                                                            .cultureCenter
                                                            .value
                                                            .data
                                                            ?.news
                                                            ?.title ??
                                                        '',
                                                    content: controller
                                                            .cultureCenter
                                                            .value
                                                            .data
                                                            ?.news
                                                            ?.content ??
                                                        '',
                                                    date: controller
                                                            .cultureCenter
                                                            .value
                                                            .data
                                                            ?.news
                                                            ?.createdAt ??
                                                        '',
                                                    imageUrl: controller
                                                            .cultureCenter
                                                            .value
                                                            .data
                                                            ?.news
                                                            ?.image ??
                                                        ''),
                                                binding: SingleNewBinding(),
                                                transition: Transition.fadeIn);
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                                horizontal: 10.w),
                                            width: double.infinity,
                                            color:
                                                Colors.black.withOpacity(0.65),
                                            child: CustomText(
                                              controller.cultureCenter.value
                                                      .data?.news?.title ??
                                                  '',
                                              textStyle: TextStyles.text11
                                                  .copyWith(
                                                      fontSize: 10.sp,
                                                      height: 1.5.h),
                                              maxLines: 5,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (ctx, i) => SizedBox(
                                  width: 12.w,
                                ),
                            itemCount: 1),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            'الأجندة',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.primary)),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child: Obx(
                          () => CustomText(
                            controller.month.value,
                            textStyle: TextStyles.text11.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.borderColor)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      GetBuilder(
                        builder: (CulturalCenterController snap) =>
                            TableCalendar(
                          onDaySelected: controller.onDaySelected,
                          selectedDayPredicate: (day) {
                            return controller.selectedDays.contains(day);
                          },
                          rangeSelectionMode: RangeSelectionMode.toggledOn,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: controller.focusDate,
                          headerVisible: false,
                          onPageChanged: (day) {
                            controller.month.value =
                                DateFormat.MMM('ar').format(day).toString();
                            controller.focusDate = day;

                            controller.monthToApi = day.month;
                            controller.fetchEvents();
                          },
                          calendarBuilders: CalendarBuilders(
                              selectedBuilder: (context, date, today) =>
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(ColorCode.primary)
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color:
                                                const Color(ColorCode.primary),
                                            width: 2),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                                DateFormat.d().format(date)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: false,
                            markerSize: 10,
                            markerDecoration: BoxDecoration(
                              color: const Color(ColorCode.primary),
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: const Color(ColorCode.primary),
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
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (ctx, i) => InkWell(
                                onTap: () {
                                  // );
                                  Get.to(
                                      () => SummerMeetingView(
                                          head: controller.cultureCenter.value
                                                  .data?.centers?[i].title ??
                                              '',
                                          backgroundImage:
                                              AppAssets.backgroundImage,
                                          buttonText: 'اشترك في الملتقى الصيفي',
                                          text: controller.cultureCenter.value
                                              .data?.centers?[i].body,
                                          isSummer: true,
                                          subHead: 'فاعيليـــات 2022'),
                                      binding: SummerMeetingBinding(),
                                      arguments: [
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].title,
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].id,
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].thumbnail,
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].hasForm,
                                        controller.monthToApi,
                                        controller.month.value,
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].programs,
                                        controller.cultureCenter.value.data
                                            ?.centers?[i].album,
                                      ]);
                                },
                                child: ContainerItem(
                                    child: Row(
                                  children: [
                                    CustomText(
                                      controller.cultureCenter.value.data
                                              ?.centers?[i].title ??
                                          '',
                                      textStyle: TextStyles.text13.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0.h),
                                      child: CachedNetworkImage(
                                        imageUrl: controller.cultureCenter.value
                                                .data?.centers?[i].thumbnail ??
                                            '',
                                        key: UniqueKey(),
                                        errorWidget: (context, url, step) =>
                                            const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ),
                          separatorBuilder: (ctx, i) => SizedBox(
                                height: 12.h,
                              ),
                          itemCount: controller
                                  .cultureCenter.value.data?.centers?.length ??
                              0),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
          onLoading: const Center(
            child: SpinKitDancingSquare(
              color: Color(ColorCode.primary),
            ),
          ),
          onError: (e) => Text(e.toString())),
    );
  }
}
