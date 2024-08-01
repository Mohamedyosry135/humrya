import 'package:cached_network_image/cached_network_image.dart';

import 'package:example_structure/widgets/player_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/dialog_container.dart';
import '../../../../widgets/home_appbar.dart';
import '../controllers/players_controller.dart';

class PlayersView extends GetView<PlayersController> {
  const PlayersView({super.key});

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
                'اللاعبين',
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
          (state) => Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
                child: Center(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.71.r,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 16.h,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, i) => Playersitem(
                        name: controller.players.value.data?[i].name ?? '',
                        image: controller.players.value.data?[i].image ?? '',
                        title:
                            controller.players.value.data?[i].position ?? '',
                        onTap: (){
                          Get.defaultDialog(
                              title: '',
                              middleText: '',
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 0.w,
                                    bottom: 0.h,
                                    left: 0.w,
                                    right: 0.w,
                                  ),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: controller
                                            .players.value.data?[i].image ??
                                            '',
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        controller.players.value.data?[i]
                                            .name ??
                                            '',
                                        style: TextStyles.text22.copyWith(
                                            color: const Color(
                                              ColorCode.primary,
                                            ),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        controller.players.value.data?[i].position ??
                                            '',
                                        style: TextStyles.text16.copyWith(
                                            color: const Color(ColorCode.gold),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(10.r),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 15.r,
                                                  color: const Color(
                                                    ColorCode.shadow,
                                                  ).withOpacity(.09))
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text('الجنسية',
                                                    style: TextStyles.text11
                                                        .copyWith(
                                                      color: const Color(
                                                          ColorCode.black),
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                                SizedBox(
                                                  width: 8.h,
                                                ),
                                                Text(
                                                    controller
                                                        .players
                                                        .value
                                                        .data?[i]
                                                        .country
                                                        ?.title ??
                                                        '',
                                                    style: TextStyles.text11
                                                        .copyWith(
                                                      color: const Color(
                                                          ColorCode.primary),
                                                      fontWeight: FontWeight.w400,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text('تاريخ الميلاد',
                                                    style: TextStyles.text11
                                                        .copyWith(
                                                      color: const Color(
                                                          ColorCode.black),
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                                SizedBox(
                                                  width: 8.h,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(DateTime
                                                          .parse(controller
                                                          .players
                                                          .value
                                                          .data![i]
                                                          .birthDate!)) ,
                                                      maxLines: 1,
                                                      style: TextStyles.text11
                                                          .copyWith(
                                                        color: const Color(
                                                            ColorCode.primary),
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text('الوصف',
                                                    style: TextStyles.text11
                                                        .copyWith(
                                                      color: const Color(
                                                          ColorCode.black),
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                                SizedBox(
                                                  width: 8.h,
                                                ),
                                                Text(
                                                    controller
                                                        .players
                                                        .value
                                                        .data?[i]
                                                        .description ??
                                                        '',
                                                    style: TextStyles.text11
                                                        .copyWith(
                                                      color: const Color(
                                                          ColorCode.primary),
                                                      fontWeight: FontWeight.w400,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ارقام اللاعب',
                                            style: TextStyles.text16.copyWith(
                                                color: const Color(
                                                    ColorCode.primary),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DialogContainer(
                                        icon: AppAssets.ballIcon,
                                        title: 'المبارايــــات',
                                        number: controller
                                            .players.value.data?[i].matches ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DialogContainer(
                                          icon: AppAssets.clockIcon,
                                          title: 'الدقــــــــائق',
                                          number: '90'),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DialogContainer(
                                          icon: AppAssets.goallIcon,
                                          title: 'أهــــــــــــداف',
                                          number: controller
                                              .players.value.data?[i].goals ??
                                              ''),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DialogContainer(
                                          icon: AppAssets.redCardIcon,
                                          title: 'كروت حمرا',
                                          number: controller.players.value
                                              .data?[i].redCards ??
                                              ''),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DialogContainer(
                                          icon: AppAssets.yellowCardIcon,
                                          title: 'كروت صفراء',
                                          number: controller.players.value
                                              .data?[i].yellowCards ??
                                              ''),
                                    ],
                                  ),
                                ),
                              ));
                        },
                        flag:
                            controller.players.value.data?[i].country?.flag ??
                                ''),
                    itemCount: controller.players.value.data?.length ?? 0,
                  ),
                ),
              ),
          onLoading: const Center(
            child: SpinKitFadingCircle(
              color: Color(ColorCode.primary),
            ),
          )),
    );
  }
}
