import 'package:example_structure/pages/about_club/binding/about_club_binding.dart';
import 'package:example_structure/pages/about_club/presentation/views/about_club_view.dart';
import 'package:example_structure/pages/achievements/presentation/views/achieve_view.dart';
import 'package:example_structure/pages/ceo_s/binding/ceo_binding.dart';
import 'package:example_structure/pages/ceo_s/presentation/views/ceo_view.dart';
import 'package:example_structure/pages/hamrya_club/presentation/controllers/club_controller.dart';
import 'package:example_structure/pages/starting/binding/starting_binding.dart';
import 'package:example_structure/pages/starting/presentation/views/starting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_generated.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../../../achievements/binding/achieve_binding.dart';

class ClubView extends GetView<ClubController> {
  const ClubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: HomeAppBar(
        height: 150.h,
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
              Expanded(
                child: CustomText(
                  'Alhamriyah culture & Sports Club',
                  textAlign: TextAlign.center,maxLines: 2,
                  textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const AboutClubView(),
                            binding: AboutClubBinding());
                      },
                      child: Container(
                        height: 267.h,
                        width: 162.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(ColorCode.borderColor),
                                width: 1.w)),
                        child: Stack(
                          children: [
                            Image(
                              image: AppAssets.logoFaded,
                              fit: BoxFit.cover,
                              height: 267.h,
                              width: 162.w,
                            ),
                            Center(
                              child: CustomText(
                                'عن النادي',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(ColorCode.primary)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => StartingView(),
                            binding: StartingBinding());
                      },
                      child: Container(
                        height: 267.h,
                        width: 162.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(ColorCode.borderColor),
                                width: 1.w)),
                        child: Stack(
                          children: [
                            Image(
                              image: AppAssets.logoFaded,
                              fit: BoxFit.cover,
                              height: 267.h,
                              width: 162.w,
                            ),
                            Center(
                              child: CustomText(
                                'النشأة والتأسيس',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(ColorCode.primary)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const AchieveView(),
                            binding: AchieveBinding());
                      },
                      child: Container(
                        height: 267.h,
                        width: 162.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(ColorCode.borderColor),
                                width: 1.w)),
                        child: Stack(
                          children: [
                            Image(
                              image: AppAssets.logoFaded,
                              fit: BoxFit.cover,
                              height: 267.h,
                              width: 162.w,
                            ),
                            Center(
                              child: CustomText(
                                'الانجازات',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(ColorCode.primary)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const CeoView(), binding: CeoBinding());
                      },
                      child: Container(
                        height: 267.h,
                        width: 162.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(ColorCode.borderColor),
                                width: 1.w)),
                        child: Stack(
                          children: [
                            Image(
                              image: AppAssets.logoFaded,
                              fit: BoxFit.cover,
                              height: 267.h,
                              width: 162.w,
                            ),
                            Center(
                              child: CustomText(
                                'مجلس الإدارة',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(ColorCode.primary)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
