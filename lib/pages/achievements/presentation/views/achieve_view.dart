import 'package:example_structure/pages/achievements/presentation/controllers/achieve_controller.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';

class AchieveView extends GetView<AchieveController> {
  const AchieveView({Key? key}) : super(key: key);

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
                'الانجازات',
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
          (snap) =>  Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, i) => Container(

                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 13.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: const Color(ColorCode.borderColor),
                                    width: 1.w)),
                            child: Column(
                              children: [
                                CustomText(
                                  controller.achieve[i].title ?? '',
                                  textStyle: TextStyles.text16.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(ColorCode.primary)),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: NetworkImage(controller.achieve[i].image ?? ''),
                                      height: 158.h,
                                      fit: BoxFit.cover,
                                      width: 287.w,
                                    )),
                                SizedBox(
                                  height: 8.h,
                                ),
                               Html(data: controller.achieve[i].content)
                              ],
                            ),
                          ),
                      separatorBuilder: (ctx, i) => SizedBox(
                            height: 30.h,
                          ),
                      itemCount: controller.achieve.length ),
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
          )
      ),
    );
  }
}
