import 'package:example_structure/pages/media_galery/bindings/Media%20_galery%20_binding.dart';
import 'package:example_structure/pages/media_galery/presentation/views/Media_galery_View.dart';
import 'package:example_structure/pages/photo_albums/presentation/views/widgets/photo_album_item.dart';
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
import '../controllers/photo _albums .dart';

class photoAlbumsView extends GetView<photoalbumsController> {
  List gallery = [
    AppAssets.gallery4,
    AppAssets.gallery3,
    AppAssets.gallery4,
    AppAssets.gallery3,
  ];

  List name = [
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
    'كاس نادي الشارقه',
  ];

  photoAlbumsView({super.key});

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
                'ألبومات الصور',
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
          (snap) => ListView.separated(
            physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                itemBuilder: (ctx, i) => InkWell(
                  onTap: (){
                    Get.to(() => const MediagaleryView(),binding: MediagaleryBinding(),arguments: [controller.albums.value.photos?[i].id,true],transition: Transition.fadeIn);
                  },
                  child: PhotoalbumWidget(
                      title: controller.albums.value.photos?[i].title ?? '',
                      imageUrl:
                          controller.albums.value.photos?[i].thumbnail ?? ''),
                ),
                separatorBuilder: (ctx, i) => SizedBox(
                  height: 12.h,
                ),
                itemCount: controller.albums.value.photos?.length ?? 0,
              ),
          onLoading: const Center(
            child: SpinKitDualRing(color: Color(ColorCode.primary)),
          )),
    );
  }
}
