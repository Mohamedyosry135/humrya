import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

import '../../../first_team_views/bindings/first_team_news_binding.dart';
import '../../../first_team_views/presentation/views/first_team_news_view.dart';
import '../controllers/Media_news _controller.dart';

class MedianewsView extends GetView<MedianewsController> {
  List albumsPhotos = [
    AppAssets.sharqaClubsGallery,
    AppAssets.sharqaClubsGallery2,
    AppAssets.sharqaClubsGallery,
    AppAssets.sharqaClubsGallery2,
    AppAssets.sharqaClubsGallery,
    AppAssets.sharqaClubsGallery2,
    AppAssets.sharqaClubsGallery,
    AppAssets.sharqaClubsGallery2,
  ];
  List videoCover = [
    AppAssets.videoCover1,
    AppAssets.videoCover2,
    AppAssets.videoCover1,
    AppAssets.videoCover2,
    AppAssets.videoCover1,
    AppAssets.videoCover2,
  ];
  List playersPhotos = [
    AppAssets.player1,
    AppAssets.player4,
    AppAssets.player3,
    AppAssets.player1,
    AppAssets.player4,
    AppAssets.player3,
  ];
  List playersNames = [
    'اليكساندر ميديروس دي ازيريدو',
    'احمد ابراهيم محمد ابراهيم الزعابي',
    'احمد محمود مراد محمود',
    'اليكساندر ميديروس دي ازيريدو',
    'احمد ابراهيم محمد ابراهيم الزعابي',
    'احمد محمود مراد محمود',
  ];
  List playerFlags = [
    AppAssets.brazil,
    AppAssets.emirates,
    AppAssets.emirates,
    AppAssets.brazil,
    AppAssets.emirates,
    AppAssets.emirates,
  ];
  List text = [
    'خط وسط',
    'حارس المرمى',
    'دفـــــــــــــــاع',
    'خط وسط',
    'حارس المرمى',
    'دفـــــــــــــــاع',
  ];

  MedianewsView({super.key});

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
                  'الأخبار',
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
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1.1.r,
                            ),
                            itemBuilder: (ctx, int i) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => FirstTeamNewsView(),
                                      binding: FirstTeamNewsBinding(),
                                      arguments: [
                                        controller.newsType
                                            .value.data?[i].name,
                                      controller.newsType
                                            .value.data?[i].id,
                                        true
                                      ],transition: Transition.fadeIn);
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.newsType
                                                  .value.data?[i].image ??
                                              '',
                                          height: 200.h,
                                          width: 160.w,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child:
                                                CircularProgressIndicator(),
                                          ),
                                          errorWidget:
                                              (context, url, stop) =>
                                                  const Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color(ColorCode.primary)
                                                .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Center(
                                          child: CustomText(
                                        controller.newsType.value.data?[i]
                                                .name ??
                                            '',
                                        maxLines: 4,
                                        textStyle: TextStyles.text13
                                            .copyWith(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount:
                                controller.newsType.value.data?.length ?? 0,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      )),
                ),
            onLoading: const Center(
              child: SpinKitWave(
                color: Color(ColorCode.primary),
              ),
            ),
            onEmpty: Center(
              child: CustomText(
                'لا يوجد اخبار',
                textStyle: TextStyle(
                    color: const Color(ColorCode.primary),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
            )));
  }
}
