import 'package:example_structure/pages/goals/binding/goals_binding.dart';
import 'package:example_structure/pages/media_news/bindings/Media%20_news%20_binding.dart';
import 'package:example_structure/pages/photo_albums/bindings/photo%20_albums%20_binding.dart';
import 'package:example_structure/widgets/custom_video_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/Photo_Gallery.dart';
import '../../../../widgets/custm_network_image_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../../widgets/text and button_widget.dart';

import '../../../goals/presentation/views/goals_view.dart';
import '../../../media_news/presentation/views/Media_news_View.dart';
import '../../../photo_albums/presentation/views/photo_albums_View.dart';
import '../../../single_new/bindings/single_new_binding.dart';
import '../../../single_new/presentation/views/single_vew_view.dart';
import '../controllers/Media _Center _controller.dart';

class MediaCenterView extends GetView<MediaCenterController> {
  const MediaCenterView({super.key});

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
                  'المركز الإعلامي',
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
                          TextandButtonWidget(
                            'معرض الصور',
                            'الألبومات',
                            onTab: () {
                              Get.to(() => photoAlbumsView(),
                                  binding: photoalbumsBinding());
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
                                itemBuilder: (ctx, i) => PhotoGalleryWidget(
                                    controller.mediaData.value.photos?[i]
                                            .thumbnail ??
                                        '',
                                    controller.mediaData.value.photos?[i]
                                            .title ??
                                        ''),
                                separatorBuilder: (ctx, i) => SizedBox(
                                      width: 12.w,
                                    ),
                                itemCount: controller
                                        .mediaData.value.photos?.length ??
                                    0),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          if (controller
                                  .mediaData.value.videos?.isNotEmpty ??
                              false)
                            Column(
                              children: [
                                TextandButtonWidget(
                                  'فيديوهات',
                                  'المزيد',
                                  onTab: () {
                                    Get.to(
                                        () => GoalsView(
                                            apptitle: 'الفيديوهات'),
                                        binding: GoalsBinding(),
                                        arguments: [0, true]);
                                  },
                                  showMore: true,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 165.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const BouncingScrollPhysics(),
                                      itemBuilder: (ctx, i) =>
                                          CustomVideoWidget(
                                              imageUrl: controller
                                                      .mediaData
                                                      .value
                                                      .videos?[i]
                                                      .thumbnail ??
                                                  '',
                                              title: controller
                                                  .mediaData
                                                  .value
                                                  .videos?[i]
                                                  .title ??
                                                  '',
                                              videoId: controller.mediaData
                                                      .value.videos?[i].url
                                                      ?.split('/')
                                                      .last ??
                                                  'none'),
                                      separatorBuilder: (ctx, i) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                      itemCount: controller.mediaData.value
                                              .videos?.length ??
                                          0),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              ],
                            ),
                          TextandButtonWidget(
                            'الأخبار ',
                            'المزيد',
                            onTab: () {
                              Get.to(() => MedianewsView(),
                                  binding: MedianewsBinding(),
                                  transition: Transition.fadeIn);
                            },
                            showMore: true,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Container(
                            height: 170.h,
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
                                itemBuilder: (ctx, i) => Container(
                                      clipBehavior:
                                          Clip.antiAliasWithSaveLayer,
                                      height: 170.h,
                                      width: 0.9.sw,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              color: const Color(
                                                  ColorCode.borderColor),
                                              width: 1.5.w,
                                              strokeAlign:
                                                  StrokeAlign.center)),
                                      child: ClipRect(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Stack(
                                          children: [
                                            CustomNetworkImageWidget(
                                              imageUrl: controller
                                                      .mediaData
                                                      .value
                                                      .news?[i]
                                                      .image ??
                                                  '',
                                              fit: BoxFit.fill,
                                              width: 1.sw * 0.9,
                                              onTap: () {
                                                Get.to(
                                                    () => SingleNewView(
                                                        title: controller
                                                                .mediaData
                                                                .value
                                                                .news?[i]
                                                                .title ??
                                                            '',
                                                        content: controller
                                                                .mediaData
                                                                .value
                                                                .news?[i]
                                                                .content ??
                                                            '',
                                                        date: controller
                                                                .mediaData
                                                                .value
                                                                .news?[i]
                                                                .createdAt ??
                                                            '',
                                                        imageUrl: controller
                                                                .mediaData
                                                                .value
                                                                .news?[i]
                                                                .image ??
                                                            ''),
                                                    binding:
                                                        SingleNewBinding(),
                                                    transition:
                                                        Transition.fadeIn);
                                              },
                                            ),
                                            Align(
                                              alignment:
                                                  Alignment.bottomCenter,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10.h,
                                                        horizontal: 10.w),
                                                width: double.infinity,
                                                color: Colors.black
                                                    .withOpacity(0.65),
                                                child: CustomText(
                                                  controller.mediaData.value
                                                          .news?[i].title ??
                                                      '',
                                                  textStyle: TextStyles
                                                      .text11
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          height: 1.5.h),
                                                  maxLines: 5,
                                                  textAlign:
                                                      TextAlign.start,
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
                                itemCount: controller
                                        .mediaData.value.news?.length ??
                                    0),
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
