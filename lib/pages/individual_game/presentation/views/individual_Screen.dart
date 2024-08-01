import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../indidual_game_single/bindings/swimming_binding.dart';
import '../../../indidual_game_single/presentation/views/swimming_view.dart';
import '../../../subscribe/bindings/subscribe_binding.dart';
import '../../../subscribe/presentation/views/subscribe_view.dart';
import '../controllers/individual_controller.dart';

class individualScreen extends GetView<individualController> {
  const individualScreen({Key? key}) : super(key: key);

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
                'الألعاب الفردية',
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
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: (60 / 70)),
                      itemBuilder: (BuildContext _context, int _index) {
                        return InkWell(
                          onTap: () {
                            if (controller.toRegister == true) {
                              Get.to(
                                  SubscribeView(
                                    title: controller
                                            .individualGames[_index]
                                            .title ??
                                        '',
                                    id: controller
                                            .individualGames[_index]
                                            .id ??
                                        0,
                                  ),
                                  binding: SubscribeBinding(),
                                  arguments: [
                                    controller
                                        .individualGames[_index].id,
                                    controller.toRegister,
                                    false
                                  ]);
                            } else {
                              Get.to(
                                  () => SingleIndividualGameView(
                                        appBarTitle: controller
                                                .individualGames[_index]
                                                .title ??
                                            '',
                                      ),
                                  binding: SingleIndidualGameBinding(),
                                  arguments: [
                                    controller
                                        .individualGames[_index].id
                                  ]);
                            }
                          },
                          child: Container(
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
                                      controller.individualGames[_index]
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
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: CustomNetworkImageWidget(
                                            imageUrl: controller
                                                    .individualGames[
                                                        _index]
                                                    .image ??
                                                '',
                                        ignoring: true,
                                        fit: BoxFit.fill,),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                      itemCount: controller.individualGames.length,
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
              )),
    );
  }
}
