import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/pages/first_team/presentation/controllers/first_team_controller.dart';
import 'package:example_structure/pages/first_team_views/bindings/first_team_news_binding.dart';
import 'package:example_structure/pages/futsal_coaching_staff/bindings/coaching_staff_binding.dart';
import 'package:example_structure/pages/futsal_coaching_staff/presentation/views/coaching_staff_view.dart';
import 'package:example_structure/pages/gallery/bindings/gallery_binding.dart';
import 'package:example_structure/pages/gallery/presentation/views/gallery_view.dart';
import 'package:example_structure/pages/goals/binding/goals_binding.dart';
import 'package:example_structure/pages/periodic_table/bindings/periodic_table_binding.dart';
import 'package:example_structure/pages/periodic_table/presentation/views/periodic_table_view.dart';
import 'package:example_structure/widgets/custom_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custm_network_image_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../../widgets/player_item.dart';
import '../../../first_team_views/presentation/views/first_team_news_view.dart';
import '../../../futsal_coaching_staff/presentation/views/widgets/coaching_staff_item.dart';
import '../../../goals/presentation/views/goals_view.dart';
import '../../../players/bindings/players_binding.dart';
import '../../../players/presentation/views/players_view.dart';
import '../../../single_new/bindings/single_new_binding.dart';
import '../../../single_new/presentation/views/single_vew_view.dart';

class FirstTeamView extends GetView<FirstTeamController> {
  const FirstTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
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
                        controller.team.value.data?.title ?? '',
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
                        if (controller.team.value.data?.league?.leagueClubs
                                    ?.length !=
                                1 &&
                            controller.team.value.data?.league?.leagueClubs
                                    ?.length !=
                                null &&
                            controller.team.value.data?.league?.leagueClubs
                                    ?.length !=
                                0)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'جدول الدوري',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => PeriodicTableView(),
                                          binding: PeriodicTableBinding(),
                                          arguments: [controller.team],
                                          transition: Transition.fadeIn);
                                    },
                                    child: CustomText(
                                      'المزيد',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
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
                                        strokeAlign: StrokeAlign.center)),
                                child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  defaultColumnWidth:
                                      const IntrinsicColumnWidth(),
                                  border: const TableBorder(
                                    horizontalInside: BorderSide(
                                        color: Color(ColorCode.borderColor)),
                                  ),
                                  children: List.generate(
                                    5,
                                    (index) => TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller.team.value.data?.league
                                                  ?.leagueClubs?[index].rank ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller
                                                  .team
                                                  .value
                                                  .data
                                                  ?.league
                                                  ?.leagueClubs?[index]
                                                  .club
                                                  ?.title ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller
                                                  .team
                                                  .value
                                                  .data
                                                  ?.league
                                                  ?.leagueClubs?[index]
                                                  .played ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller.team.value.data?.league
                                                  ?.leagueClubs?[index].won ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller.team.value.data?.league
                                                  ?.leagueClubs?[index].lost ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller.team.value.data?.league
                                                  ?.leagueClubs?[index].drawn ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller.team.value.data?.league
                                                  ?.leagueClubs?[index].goals ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller
                                                  .team
                                                  .value
                                                  .data
                                                  ?.league
                                                  ?.leagueClubs?[index]
                                                  .goalDifference ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0.h),
                                        child: CustomText(
                                          controller
                                                  .team
                                                  .value
                                                  .data
                                                  ?.league
                                                  ?.leagueClubs?[index]
                                                  .points ??
                                              '',
                                          textStyle: TextStyles.text11.copyWith(
                                              color: const Color(
                                                  ColorCode.primary),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ]),
                                  ),
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
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        if (controller.team.value.data?.news?.isNotEmpty ??
                            false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => FirstTeamNewsView(),
                                          binding: FirstTeamNewsBinding(),
                                          arguments: [
                                            controller.team.value.data?.title,
                                            controller.id,
                                            false
                                          ],
                                          transition: Transition.fadeIn);
                                    },
                                    child: CustomText(
                                      'المزيد',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: List.generate(
                                      controller
                                              .team.value.data?.news?.length ??
                                          0,
                                      (i) => Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 1.sw * 0.7,
                                                  child: CustomText(
                                                    controller.team.value.data
                                                            ?.news?[i].title ??
                                                        '',
                                                    textStyle: TextStyles.text13
                                                        .copyWith(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: const Color(
                                                                ColorCode
                                                                    .borderColor)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                CustomNetworkImageWidget(
                                                  imageUrl: controller.team.value
                                                          .data?.news?[i].image ??
                                                      '',
                                                  fit: BoxFit.fill,
                                                  height: 150.h,
                                                  onTap: () {
                                                    Get.to(
                                                        () => SingleNewView(
                                                            title: controller
                                                                    .team
                                                                    .value
                                                                    .data
                                                                    ?.news?[i]
                                                                    .title ??
                                                                '',
                                                            content: controller
                                                                    .team
                                                                    .value
                                                                    .data
                                                                    ?.news?[i]
                                                                    .content ??
                                                                '',
                                                            date: controller
                                                                    .team
                                                                    .value
                                                                    .data
                                                                    ?.news?[i]
                                                                    .createdAt ??
                                                                '',
                                                            imageUrl: controller
                                                                    .team
                                                                    .value
                                                                    .data
                                                                    ?.news?[i]
                                                                    .image ??
                                                                ''),
                                                        binding:
                                                            SingleNewBinding(),transition: Transition.fadeIn);
                                                  },
                                                  width: 1.sw * 0.9,
                                                )
                                              ],
                                            ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        if (controller.team.value.data?.albums?.isNotEmpty ??
                            false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'معرض الصور',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => GalleryView(),
                                          binding: GalleryBinding(),
                                          transition: Transition.fadeIn);
                                    },
                                    child: CustomText(
                                      'الألبومات',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                height: 140.h,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.08),
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
                                    itemBuilder: (ctx, i) => ClipRRect(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: CachedNetworkImage(
                                            imageUrl: controller.team.value.data
                                                    ?.albums?[i] ??
                                                '')),
                                    separatorBuilder: (ctx, i) => SizedBox(
                                          width: 12.w,
                                        ),
                                    itemCount: 6),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        // if (controller.team.value.data?.albums?.isNotEmpty ??
                        //     false)       Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     CustomText(
                        //       'المباريات القادمة',
                        //       textStyle: TextStyles.text16.copyWith(
                        //           fontSize: 14.sp,
                        //           fontWeight: FontWeight.w700,
                        //           color: const Color(ColorCode.primary)),
                        //     ),
                        //     SizedBox(
                        //       height: 16.h,
                        //     ),
                        //     Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         Container(
                        //           height: 100.h,
                        //           width: 153.w,
                        //           decoration: BoxDecoration(
                        //               color: const Color(ColorCode.white),
                        //               borderRadius: BorderRadius.circular(10.r),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     spreadRadius: 0,
                        //                     blurRadius: 19,
                        //                     color: const Color(0xff000000)
                        //                         .withOpacity(0.08),
                        //                     offset: const Offset(0, 0))
                        //               ]),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Image(
                        //                     image: AppAssets.logo,
                        //                     height: 28.h,
                        //                     width: 28.w,
                        //                   ),
                        //                   CustomText(
                        //                     'الحمريه',
                        //                     textStyle: TextStyles.text11
                        //                         .copyWith(
                        //                             fontSize: 12.sp,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: Colors.black),
                        //                   )
                        //                 ],
                        //               ),
                        //               CustomText(
                        //                 'VS',
                        //                 textStyle: TextStyles.text13.copyWith(
                        //                     color: const Color(
                        //                         ColorCode.borderColor)),
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Image(
                        //                     image: AppAssets.logo,
                        //                     height: 28.h,
                        //                     width: 28.w,
                        //                   ),
                        //                   CustomText(
                        //                     'الحمريه',
                        //                     textStyle: TextStyles.text11
                        //                         .copyWith(
                        //                             fontSize: 12.sp,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: Colors.black),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           height: 100.h,
                        //           width: 153.w,
                        //           decoration: BoxDecoration(
                        //               color: const Color(ColorCode.white),
                        //               borderRadius: BorderRadius.circular(10.r),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     spreadRadius: 0,
                        //                     blurRadius: 19,
                        //                     color: const Color(0xff000000)
                        //                         .withOpacity(0.08),
                        //                     offset: const Offset(0, 0))
                        //               ]),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Image(
                        //                     image: AppAssets.logo,
                        //                     height: 28.h,
                        //                     width: 28.w,
                        //                   ),
                        //                   CustomText(
                        //                     'الحمريه',
                        //                     textStyle: TextStyles.text11
                        //                         .copyWith(
                        //                             fontSize: 12.sp,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: Colors.black),
                        //                   )
                        //                 ],
                        //               ),
                        //               CustomText(
                        //                 'VS',
                        //                 textStyle: TextStyles.text13.copyWith(
                        //                     color: const Color(
                        //                         ColorCode.borderColor)),
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Image(
                        //                     image: AppAssets.logo,
                        //                     height: 28.h,
                        //                     width: 28.w,
                        //                   ),
                        //                   CustomText(
                        //                     'الحمريه',
                        //                     textStyle: TextStyles.text11
                        //                         .copyWith(
                        //                             fontSize: 12.sp,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: Colors.black),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       height: 24.h,
                        //     ),
                        //   ],
                        // ),
                        if (controller.team.value.data?.players?.isNotEmpty ??
                            false)
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'اللاعبين',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const PlayersView(),
                                          binding: PlayersBinding(),
                                          arguments: [controller.id]);
                                    },
                                    child: CustomText(
                                      'المزيد',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                height: 150.h,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.08),
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
                                    itemBuilder: (ctx, i) => SizedBox(
                                      height: 200,
                                      child: Playersitem(
                                            name: controller.team.value.data
                                                    ?.players?[i].name ??
                                                '',
                                            boxHeight: 180.h,
                                            boxWidth: 130.w,
                                            flag: controller.team.value.data
                                                    ?.players?[i].country?.flag ??
                                                '',
                                            title: controller.team.value.data
                                                    ?.players?[i].position ??
                                                '',
                                            image: controller.team.value.data
                                                    ?.players?[i].image ??
                                                '',
                                          ),
                                    ),
                                    separatorBuilder: (ctx, i) => SizedBox(
                                          width: 12.w,
                                        ),
                                    itemCount: controller
                                            .team.value.data?.players?.length ??
                                        0),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        if (controller.team.value.data?.coaches?.isNotEmpty ??
                            false)
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'الجهاز الفني',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(
                                          () => const FutsalCoachingStaffView(),
                                          binding: FutsalCoachingStaffBinding(),
                                          transition: Transition.fadeIn);
                                    },
                                    child: CustomText(
                                      'المزيد',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                height: 107.h,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.08),
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
                                    itemBuilder: (ctx, i) => CoachingStaffitem(
                                          height: 136..h,
                                          width: 130.67.w.w,
                                        ),
                                    separatorBuilder: (ctx, i) => SizedBox(
                                          width: 12.w,
                                        ),
                                    itemCount: controller
                                            .team.value.data?.coaches?.length ??
                                        0),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),

                        if (controller.team.value.data?.videos?.isNotEmpty ??
                            false)
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'الأهداف',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(
                                          () => GoalsView(apptitle: 'الأهداف'),
                                          binding: GoalsBinding(),
                                          arguments: [controller.id, false],
                                          transition: Transition.fadeIn);
                                    },
                                    child: CustomText(
                                      'المزيد',
                                      textStyle: TextStyles.text16.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              const Color(ColorCode.primary)),
                                    ),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: List.generate(
                                      controller.team.value.data?.videos
                                              ?.length ??
                                          0,
                                      (i) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: CustomVideoWidget(
                                              imageUrl: controller
                                                      .team
                                                      .value
                                                      .data
                                                      ?.videos?[i]
                                                      .thumbnail ??
                                                  '',
                                              videoId: controller.team.value
                                                      .data?.videos?[i].url
                                                      ?.split('/')
                                                      .last ??
                                                  'xfKMOcxYlEA',
                                              title: controller.team.value.data
                                                      ?.videos?[i].title ??
                                                  '',
                                            ),
                                          )),
                                ),
                              )
                            ],
                          ),
                      ],
                    )),
              ),
            ),
        onLoading: Container(
          height: 1.sh,
          width: 1.sw,
          color: Colors.white,
          child: const Center(
            child: SpinKitChasingDots(
              color: Color(ColorCode.primary),
            ),
          ),
        ));
  }
}
