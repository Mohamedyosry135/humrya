import 'package:example_structure/pages/first_team/bindings/first_team_binding.dart';
import 'package:example_structure/pages/first_team/presentation/views/first_team_view.dart';
import 'package:example_structure/pages/football/presentations/controllers/football_controller.dart';
import 'package:example_structure/pages/football/presentations/views/widget/clubs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../../../../widgets/news_widget.dart';

class FootballView extends GetView<FootballController> {
  const FootballView({super.key});

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
                controller.title ?? '',
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
                    EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        if (controller.footBall.value.data?.news?.isNotEmpty ??
                            false)
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'الأخبار',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    'المزيد',
                                    textStyle: TextStyles.text16.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(ColorCode.primary)),
                                  ),
                                  SvgPicture.asset(AppSVGAssets.moreArrow)
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                height: 140.h,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.08),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ]),
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (ctx, i) => NewsWidget(
                                        imageurl: '',
                                        content: 'content',
                                        date: 'date',
                                        title: ''),
                                    separatorBuilder: (ctx, i) => SizedBox(
                                          width: 12.w,
                                        ),
                                    itemCount: 6),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctx, i) => InkWell(
                                onTap: () {
                                  Get.to(() => const FirstTeamView(),
                                      binding: FirstTeamBinding(),
                                      arguments: [
                                        controller
                                            .footBall.value.data?.teams?[i].id
                                      ],transition: Transition.fadeIn);
                                },
                                child: ClubsWidget(controller
                                        .footBall.value.data?.teams?[i].name ??
                                    'لا يوجد اسم')),
                            separatorBuilder: (ctx, i) => SizedBox(
                                  height: 16.h,
                                ),
                            itemCount:
                                controller.footBall.value.data?.teams?.length ??
                                    0)
                      ],
                    )),
              ),
          onLoading: const Center(
            child: SpinKitDualRing(color: Color(ColorCode.primary)),
          )),
    );
  }
}
