import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/widgets/custm_network_image_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/Photo_Gallery.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../../widgets/text and button_widget.dart';
import '../../../media_galery/bindings/Media _galery _binding.dart';
import '../../../media_galery/presentation/views/Media_galery_View.dart';
import '../controllers/swimming_controller.dart';

class SingleIndividualGameView extends GetView<SingleIndividualGameController> {
  String appBarTitle;
  SingleIndividualGameView({super.key, required this.appBarTitle});

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
                  appBarTitle,
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
                  padding: EdgeInsets.symmetric(
                      vertical: 0.0.h, horizontal: 22.w),
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          if (controller.gameData.value.data?.photos
                                  ?.isNotEmpty ??
                              false)
                            Column(
                              children: [
                                TextandButtonWidget(
                                  'معرض الصور',
                                  'المزيد',
                                  onTab: () {
                                    Get.to(() => const MediagaleryView(),
                                        binding: MediagaleryBinding(),
                                        arguments: [controller.id, false]);
                                  },
                                  showMore: true,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 250.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, i) =>
                                          PhotoGalleryWidget(
                                              controller.gameData.value.data
                                                      ?.photos?[i].url ??
                                                  '',
                                              controller.gameData.value.data
                                                      ?.photos?[i].title ??
                                                  ''),
                                      separatorBuilder: (ctx, i) =>
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                      itemCount: controller.gameData.value
                                              .data?.photos?.length ??
                                          0),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          if (controller
                                  .gameData.value.data?.news?.isNotEmpty ??
                              false)
                            Column(
                              children: [
                                TextandButtonWidget(
                                  'الأخبار',
                                  'المزيد',
                                  onTab: () {
                                    null;
                                  },
                                  showMore: false,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 340.h,
                                  width: 1.sw * 0.9,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, i) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 1.sw * 0.7,
                                                child: CustomText(
                                                  controller
                                                          .gameData
                                                          .value
                                                          .data
                                                          ?.news?[i]
                                                          .title ??
                                                      '',
                                                  textStyle: TextStyles
                                                      .text13
                                                      .copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                          color: const Color(
                                                              ColorCode
                                                                  .borderColor)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              CustomNetworkImageWidget(
                                                imageUrl: controller
                                                        .gameData
                                                        .value
                                                        .data
                                                        ?.news?[i]
                                                        .image ??
                                                    '',fit: BoxFit.fill,
                                                height: 300.h,   width: 1.sw * 0.9,
                                              )
                                            ],
                                          ),
                                      separatorBuilder: (ctx, i) =>
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                      itemCount: controller.gameData.value
                                              .data?.news?.length ??
                                          0),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                        ],
                      )),
                ),
            onLoading: const Center(
              child: SpinKitDualRing(color: Color(ColorCode.primary)),
            )));
  }
}
