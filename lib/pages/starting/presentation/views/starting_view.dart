import 'package:example_structure/pages/starting/presentation/controllers/stating_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class StartingView extends GetView<StartingController> {
  Widget? widget;
  StartingView({super.key,  this.widget});


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
                'النشأة والتأسيس',
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
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                Html(data: controller.content.value)


                ],
              )),
        ), onLoading: const Center(
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
