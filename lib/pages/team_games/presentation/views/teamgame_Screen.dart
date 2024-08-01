import 'package:example_structure/pages/football/bindings/football_binding.dart';
import 'package:example_structure/pages/football/presentations/views/football_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custm_network_image_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../subscribe/bindings/subscribe_binding.dart';
import '../../../subscribe/presentation/views/subscribe_view.dart';
import '../controllers/teamgame_controller.dart';

class teamgameScreen extends GetView<TeamGamesController> {
  const teamgameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFEFEFE),
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
                  'الألعاب الجماعية',
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
              padding: EdgeInsets.only(left: 30.0.h, right: 30.w),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      GridView.builder(
                        primary: true,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8.h,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 0.8.r),
                        itemBuilder:
                            (BuildContext _context, int _index) {
                          return InkWell(
                            onTap: () {
                              if (controller.toRegister == true) {
                                Get.to(
                                    SubscribeView(
                                      title: controller
                                              .teamGames[_index]
                                              .title ??
                                          '',
                                      id: controller
                                              .teamGames[_index].id ??
                                          0,
                                    ),
                                    binding: SubscribeBinding(),
                                    arguments: [
                                      controller.teamGames[_index].id,
                                      controller.toRegister,
                                      true
                                    ]);
                              } else {
                                Get.to(() => const FootballView(),
                                    binding: FootballBinding(),
                                    arguments: [
                                      controller.teamGames[_index].id,
                                      controller.teamGames[_index].title
                                    ]);
                              }
                            },
                            child: Container(
                                width: 154.w,
                                height: 176.h,
                                padding: EdgeInsets.all(16.sp),
                                decoration: BoxDecoration(
                                  color: const Color(ColorCode.white)
                                      .withOpacity(0.55),
                                  borderRadius:
                                      BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      CustomText(
                                        controller.teamGames[_index]
                                                .title ??
                                            '',
                                        textStyle:
                                            TextStyles.text16.copyWith(
                                          color: const Color(
                                              ColorCode.primary),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: ClipRRect(
                                          clipBehavior: Clip
                                              .antiAliasWithSaveLayer,
                                          borderRadius:
                                              BorderRadius.circular(
                                                  15.r),
                                          child:
                                              CustomNetworkImageWidget(
                                            imageUrl: controller
                                                    .teamGames[_index]
                                                    .image ??
                                                '',
                                            ignoring: true,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                        itemCount: controller.teamGames.length,
                      ),
                    ],
                  )),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator(
                color: Color(ColorCode.primary),
                strokeWidth: 4,
              ),
            ),
            onError: (e) => Center(
                  child: Text(
                    'خطأ',
                    style: TextStyles.text22.copyWith(color: Colors.red),
                  ),
                )));
  }
}
