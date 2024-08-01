import 'package:example_structure/pages/individual_game/binding/individual_binding.dart';
import 'package:example_structure/pages/team_games/binding/teamgame_binding.dart';
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
import '../../../individual_game/presentation/views/individual_Screen.dart';
import '../../../team_games/presentation/views/teamgame_Screen.dart';
import '../controllers/sportsgame_controller.dart';

class SportsgameScreen extends GetView<SportsgameController> {
  const SportsgameScreen({Key? key}) : super(key: key);

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
                  'الألعاب الرياضية',
                  textAlign: TextAlign.center,
                  textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
                ),
             if(controller.isBack  == true)   InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(AppSVGAssets.back)),
                if(controller.isBack  == false)    Opacity(
                  opacity: 0,
                  child: SvgPicture.asset(AppSVGAssets.back),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0.h, right: 30.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const individualScreen(),
                            binding: individualBinding(context: context),arguments: [controller.toRegister]);
                      },
                      child: Container(
                          width: 315.w,
                          height: 315.h,
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.white)
                                .withOpacity(0.55),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image(
                                  image: AppAssets.individual,
                                  height: 282.h,
                                  width: 282.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: CustomText(
                                  'الألعاب الفردية',
                                  textStyle: TextStyles.text16.copyWith(
                                    fontSize: 20.sp,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const teamgameScreen(),
                            binding: teamgameBinding(context: context),arguments: [controller.toRegister]);
                      },
                      child: Container(
                          width: 315.w,
                          height: 315.h,
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.white)
                                .withOpacity(0.55),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image(
                                  image: AppAssets.team,
                                  height: 282.h,
                                  width: 282.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: CustomText(
                                  'الألعاب الجماعية',
                                  textStyle: TextStyles.text16.copyWith(
                                    fontSize: 20.sp,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                )),
          ),
        ));
  }
}
