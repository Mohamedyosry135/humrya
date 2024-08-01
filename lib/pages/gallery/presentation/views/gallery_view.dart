import 'package:example_structure/pages/gallery/presentation/controllers/gallery_controller.dart';
import 'package:example_structure/pages/sharqa_clubs_gallery/presentation/views/sharqa_clubs_gallery_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class GalleryView extends GetView<GalleryController> {
  List gallery = [
    AppAssets.gallery4,
    AppAssets.gallery3,
    AppAssets.gallery4,
    AppAssets.gallery3,
  ];

  GalleryView({super.key});

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
                    // PersistentNavBarNavigator.pushNewScreen(
                    //   context,
                    //   screen:  FirstTeamView(),
                    //   withNavBar: true, // OPTIONAL VALUE. True by default.
                    //   pageTransitionAnimation:
                    //   PageTransitionAnimation.fade,
                    // );
                    // Get.find<MainViewController>().navController.value =
                    //     PersistentTabController(initialIndex: 2);
                    // Get.find<MainViewController>().navIndex.value = 2;
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: SharqaClubsGalleryView(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation:
                    PageTransitionAnimation.fade,
                  );
                },
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image(
                      image: gallery[index],
                      height: 143.h,
                      width: 315.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'كأس أندية الشارقة',
                    style: TextStyles.text22.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: const Color(ColorCode.gold),
                    ),
                  ),
                ]),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 16.h,
                ),
            itemCount: gallery.length),
      ),
    );
  }
}
