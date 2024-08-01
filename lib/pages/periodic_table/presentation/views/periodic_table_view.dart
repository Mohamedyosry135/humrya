import 'package:example_structure/pages/periodic_table/presentation/controllers/periodic_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class PeriodicTableView extends GetView<PeriodicTableController> {
  bool isFutsal;
  Widget? backWidget;
  PeriodicTableView({super.key, this.isFutsal = false, this.backWidget});

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
                'جدول الدوري',
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

                  width: 315.w,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: const Color(ColorCode.white),
                      border: Border.all(
                          color:
                          const Color(ColorCode.borderColor),
                          width: 1.0.w,
                          strokeAlign:
                          StrokeAlign.outside)),
                  child: Table(
                    defaultVerticalAlignment:
                    TableCellVerticalAlignment.middle,
                    defaultColumnWidth:
                    const IntrinsicColumnWidth(),
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                          color: Color(ColorCode.borderColor)),
                    ),
                    children: controller
                        .team.value.data?.league?.leagueClubs
                        ?.map(
                          (e) => TableRow(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.rank ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.club?.title ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.played ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.won ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.lost ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.drawn ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.goals ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.goalDifference ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h),
                          child: CustomText(
                            e.points ?? '',
                            textStyle: TextStyles.text11
                                .copyWith(
                                color: const Color(
                                    ColorCode
                                        .primary),
                                fontSize: 8.sp,
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ),
                      ]),
                    )
                        .toList() ??
                        [],
                    // children: [
                    //   TableRow(children: [
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'المركز',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'النادي',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'لعب',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'فاز',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'خسارة',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'تعادل',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'الأهداف',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'الفرق',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         'النقاط',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ]),
                    //   TableRow(children: [
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '1',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 4.0.h),
                    //       child: Row(
                    //         crossAxisAlignment:
                    //             CrossAxisAlignment.end,
                    //         children: [
                    //           const Image(
                    //               image: AppAssets.clubFlag4),
                    //           SizedBox(
                    //             width: 4.w,
                    //           ),
                    //           CustomText(
                    //             'الجزيرة الحمراء',
                    //             textStyle: TextStyles.text11
                    //                 .copyWith(
                    //                     fontSize: 9.sp,
                    //                     textBaseline: TextBaseline
                    //                         .alphabetic,
                    //                     fontWeight:
                    //                         FontWeight.w400,
                    //                     color: const Color(
                    //                         ColorCode.black)),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '12',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ]),
                    //   TableRow(children: [
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '2',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 4.0.h),
                    //       child: Row(
                    //         crossAxisAlignment:
                    //             CrossAxisAlignment.end,
                    //         children: [
                    //           const Image(
                    //               image: AppAssets.clubFlag3),
                    //           SizedBox(
                    //             width: 4.w,
                    //           ),
                    //           CustomText(
                    //             'فرسان هيسبانيا',
                    //             textStyle: TextStyles.text11
                    //                 .copyWith(
                    //                     fontSize: 9.sp,
                    //                     textBaseline: TextBaseline
                    //                         .alphabetic,
                    //                     fontWeight:
                    //                         FontWeight.w400,
                    //                     color: const Color(
                    //                         ColorCode.black)),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '12',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ]),
                    //   TableRow(children: [
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '3',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 4.0.h),
                    //       child: Row(
                    //         crossAxisAlignment:
                    //             CrossAxisAlignment.end,
                    //         children: [
                    //           const Image(
                    //               image: AppAssets.clubFlag2),
                    //           SizedBox(
                    //             width: 4.w,
                    //           ),
                    //           CustomText(
                    //             'الذيد',
                    //             textStyle: TextStyles.text11
                    //                 .copyWith(
                    //                     fontSize: 9.sp,
                    //                     textBaseline: TextBaseline
                    //                         .alphabetic,
                    //                     fontWeight:
                    //                         FontWeight.w400,
                    //                     color: const Color(
                    //                         ColorCode.black)),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '12',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ]),
                    //   TableRow(children: [
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 4.0.h),
                    //       child: Row(
                    //         crossAxisAlignment:
                    //             CrossAxisAlignment.end,
                    //         children: [
                    //           const Image(
                    //               image: AppAssets.clubFlag1),
                    //           SizedBox(
                    //             width: 4.w,
                    //           ),
                    //           CustomText(
                    //             'العربي',
                    //             textStyle: TextStyles.text11
                    //                 .copyWith(
                    //                     fontSize: 9.sp,
                    //                     textBaseline: TextBaseline
                    //                         .alphabetic,
                    //                     fontWeight:
                    //                         FontWeight.w400,
                    //                     color: const Color(
                    //                         ColorCode.black)),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '7',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '4',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 8.0.h),
                    //       child: CustomText(
                    //         '12',
                    //         textStyle: TextStyles.text11.copyWith(
                    //             color: const Color(
                    //                 ColorCode.primary),
                    //             fontSize: 8.sp,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ]),
                    // ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
