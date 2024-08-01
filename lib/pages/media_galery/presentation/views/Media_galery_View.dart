import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../controllers/Media_galery _controller.dart';

class MediagaleryView extends GetView<MediagaleryController> {
  const MediagaleryView({super.key});

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
                  'معرض الصور',
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
                          GridView.builder(
                            primary: true,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: (40 / 40)),
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: CustomNetworkImageWidget(
                                      imageUrl: controller.isMediaCenter ==
                                              true
                                          ? controller.album.value.photos
                                                  ?.photo![index]
                                                  .toString() ??
                                              ''
                                          : controller
                                                  .singleIndividualGamePhotos
                                                  .value
                                                  .data?[index]
                                                  .url ??
                                              ''));
                            },
                            itemCount: controller.isMediaCenter == true
                                ? controller.album.value.photos?.photo
                                        ?.length ??
                                    0
                                : controller.singleIndividualGamePhotos
                                        .value.data?.length ??
                                    0,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      )),
                ),
            onLoading: const Center(
              child: SpinKitDualRing(color: Color(ColorCode.primary)),
            )));
  }
}
