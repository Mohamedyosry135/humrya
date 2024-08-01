import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:example_structure/models/culture_center_event_model.dart'
    hide Center;
import 'package:example_structure/models/culture_center_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart' hide TextDirection;
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../widgets/calendar_utils.dart';

class SummerMeetingController extends SuperController<dynamic> {
  String? name;
  int? id;
  String? image;
  String? hasForm;
  int? monthToApi;
  String? month;
  DateTime? focusedDay;
  List<CulturePrograms>? programs;
  List<String>? album;
  RxList<CultureCenterEventModel> events = <CultureCenterEventModel>[].obs;
  final Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  final ValueNotifier<List<Event>> selectedEvents = ValueNotifier([]);

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (selectedDays.contains(selectedDay)) {
      // Get.defaultDialog(
      //     title: '',
      //     titleStyle: TextStyle(
      //         fontSize: 19.sp,
      //         color: const Color(ColorCode.primary),
      //         fontWeight: FontWeight.w700),
      //     content: Column(
      //       children: [
      //         Row(
      //           children: [
      //             const Spacer(),
      //             Text(
      //               DateFormat('yyyy MMM dd').format(selectedDay),
      //               textDirection: TextDirection.ltr,
      //               textAlign: TextAlign.end,
      //               style: TextStyle(
      //                   fontSize: 14.sp,
      //                   fontWeight: FontWeight.w700,
      //                   color: const Color(ColorCode.borderColor)),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 12.h,
      //         ),
      //         Text(
      //           events
      //                   .firstWhere((element) =>
      //                       DateFormat('yyyy-MM-dd')
      //                           .format(DateTime.parse(element.date!)) ==
      //                       DateFormat('yyyy-MM-dd').format(selectedDay))
      //                   .title ??
      //               '',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //               fontSize: 19.sp,
      //               color: const Color(ColorCode.primary),
      //               fontWeight: FontWeight.w700),
      //         ),
      //         SizedBox(height: 16.sp,),
      //         Text(
      //           events
      //                   .firstWhere((element) =>
      //                       DateFormat('yyyy-MM-dd')
      //                           .format(DateTime.parse(element.date!)) ==
      //                       DateFormat('yyyy-MM-dd').format(selectedDay))
      //                   .body ??
      //               '',
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ));
      Get.dialog(Column(
        children: [
          const Spacer(),
          Center(
            child: SizedBox(

              width: 1.sw * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Material(
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 18.0.w,vertical: 20.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              Text(
                                DateFormat('yyyy MMM dd').format(selectedDay),
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(ColorCode.borderColor)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            events
                                    .firstWhere((element) =>
                                        DateFormat('yyyy-MM-dd')
                                            .format(DateTime.parse(element.date!)) ==
                                        DateFormat('yyyy-MM-dd').format(selectedDay))
                                    .title ??
                                '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: const Color(ColorCode.primary),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 16.sp,
                          ),
                          Text(
                            events
                                    .firstWhere((element) =>
                                        DateFormat('yyyy-MM-dd')
                                            .format(DateTime.parse(element.date!)) ==
                                        DateFormat('yyyy-MM-dd').format(selectedDay))
                                    .body ??
                                '',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ));
    }
  }

  Future fetchData() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(
          url: 'culture-center/events?center=$id&month=$monthToApi');
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          events.add(CultureCenterEventModel.fromJson(element));
        });
        if (events.isNotEmpty) {
          for (var element in events) {
            selectedDays.add(DateTime.parse(element.date!));
          }
          change(true, status: RxStatus.success());
        } else {
          change(true, status: RxStatus.empty());
        }

        print(selectedDays.length);
      }
    } catch (e) {
      change(false, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    name = Get.arguments[0];
    id = Get.arguments[1];
    image = Get.arguments[2];
    hasForm = Get.arguments[3];
    monthToApi = Get.arguments[4];
    month = Get.arguments[5];
    programs = Get.arguments[6];
    album = Get.arguments[7];
    focusedDay = DateTime(DateTime.now().year, monthToApi!, 1);
    fetchData();
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
