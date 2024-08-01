import 'package:example_structure/pages/single_new/presentation/controllers/single_new_controller.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custm_network_image_widget.dart';
import '../../../../widgets/custom_text.dart';

class SingleNewView extends GetView<SingleNewController> {
  String title;
  String imageUrl;
  String content;
  String date;
  SingleNewView(
      {super.key, required this.title,
      required this.content,
      required this.date,
      required this.imageUrl});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                  title,
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text13
                      .copyWith(color: const Color(ColorCode.borderColor)),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(15.r),
                  child:  CustomNetworkImageWidget(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CustomText(
                      date,
                      textStyle: TextStyles.text11.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 7.sp,
                          color: const Color(ColorCode.primary)),
                    ),
                    const Spacer(),
                    // SvgPicture.asset(AppSVGAssets.visibile),
                    // SizedBox(
                    //   width: 8.w,
                    // ),
                    // SvgPicture.asset(AppSVGAssets.like),
                    // SizedBox(
                    //   width: 8.w,
                    // ),
                    // SvgPicture.asset(AppSVGAssets.share),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Html(data: content),
                // CustomText(
                //   HtmlUnescape().convert(content),
                //   textStyle: TextStyles.text11.copyWith(
                //       fontSize: 16.sp,
                //       fontWeight: FontWeight.w700,
                //       height: 2.0.h,
                //       color: const Color(0xff646464)),
                //   textAlign: TextAlign.start,
                //   maxLines: 20,
                // )
              ],
            )),
      ),
    );
  }
}
