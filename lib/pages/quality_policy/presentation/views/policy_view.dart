import 'package:example_structure/pages/quality_policy/presentation/controllers/policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class PolicyView extends GetView<PolicyCintroller> {
  const PolicyView({Key? key}) : super(key: key);

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
                'سياسة الجودة',
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
                padding:
                    EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 30.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        controller.title.value,
                        textStyle: TextStyles.text16
                            .copyWith(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 5,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Html(
                              data:controller.content.value,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                'رئيــس مجلس الإدارة',
                                textAlign: TextAlign.end,
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 14.sp,
                                    color: const Color(ColorCode.black)),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomText(
                                'جمعة عبيد الشامسي',
                                textAlign: TextAlign.end,
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 14.sp,
                                    color: const Color(ColorCode.black),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AppAssets.iso1,
                            height: 80.h,
                            width: 75.w,
                          ),
                          Image(
                            image: AppAssets.iso2,
                            height: 80.h,
                            width: 75.w,
                          ),
                          Image(
                            image: AppAssets.iso3,
                            height: 80.h,
                            width: 75.w,
                          ),
                          Image(
                            image: AppAssets.iso4,
                            height: 80.h,
                            width: 75.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
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
              )),
    );
  }
}
