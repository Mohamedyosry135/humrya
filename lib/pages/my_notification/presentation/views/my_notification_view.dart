import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/pages/my_notification/presentation/controllers/my_notification_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class MyNotificationView extends GetView<MyNotificationController> {
  Widget? backwadget;
  MyNotificationView({
    Key? key,
    this.backwadget,
  }) : super(key: key);

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
                  'الإشعــارات',
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
        body: Obx(() => controller.isFirstLoading.value == false
            ? Stack(
                children: [
                  if (controller.notifications.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.0.h, horizontal: 22.w),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 24.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.readAllNotification();
                                },
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                    'قراءة الكل',
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyles.text22.copyWith(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary),
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  controller: controller.scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (ctx, i) => InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h, horizontal: 15.w),
                                          decoration: BoxDecoration(
                                              color:
                                                  const Color(ColorCode.white)
                                                      .withOpacity(0.55),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color(
                                                      ColorCode.lightGray))),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomText(
                                                          controller
                                                                  .notifications[
                                                                      i]
                                                                  .title ??
                                                              '',
                                                          textStyle: TextStyles
                                                              .text13
                                                              .copyWith(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: const Color(
                                                                      ColorCode
                                                                          .black)),
                                                        ),
                                                        SizedBox(
                                                          height: 16.h,
                                                        ),
                                                        CustomText(
                                                          controller
                                                                  .notifications[
                                                                      i]
                                                                  .body ??
                                                              '',
                                                          textStyle: TextStyles
                                                              .text13
                                                              .copyWith(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: const Color(
                                                                      ColorCode
                                                                          .black)),
                                                        ),
                                                        SizedBox(
                                                          height: 16.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  ('${DateFormat('yyyy-MM-dd').format(DateTime.parse(controller.notifications[i].createdAt!))}  ${DateFormat("h:mma").format(DateTime.parse(controller.notifications[i].createdAt!))}'),
                                                  textAlign: TextAlign.end,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyles.text11
                                                      .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.41,
                                                          color: const Color(
                                                              ColorCode
                                                                  .darkGray)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (ctx, i) => SizedBox(
                                        height: 16.h,
                                      ),
                                  itemCount: controller.notifications.length),
                              const SizedBox(
                                height: 24,
                              ),
                              if (controller.isLoading.value == true)
                                const SpinKitChasingDots(
                                  color: Color(ColorCode.primary),
                                )
                            ],
                          )),
                    ),
                  if (controller.notifications.isEmpty)
                    Center(
                      child: CustomText(
                        'لا يوجد اشعارات',
                        textStyle:
                            TextStyles.text16.copyWith(color: Colors.black),
                      ),
                    )
                ],
              )
            : const Center(
                child: SpinKitCircle(
                  color: Color(ColorCode.primary),
                ),
              )));
  }
}
