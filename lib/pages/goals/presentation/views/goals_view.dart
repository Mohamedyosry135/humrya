import 'package:example_structure/pages/goals/presentation/controllers/goals_controller.dart';
import 'package:example_structure/widgets/custom_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class GoalsView extends GetView<GoalsController> {
  String? apptitle;
  GoalsView({Key? key, required this.apptitle}) : super(key: key);

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
                '$apptitle',
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.85.r),
                itemBuilder: (ctx, i) => CustomVideoWidget(
                  imageUrl: controller.videos[i].thumbnail ?? '',
                  videoId: controller.videos[i].url?.split('/').last ?? 'none',
                  title: controller.videos[i].title ?? '',
                ),
                itemCount: controller.videos.length,
              )),
          onLoading: const Center(
            child: SpinKitDoubleBounce(
              color: Color(ColorCode.primary),
            ),
          )),
    );
  }
}
