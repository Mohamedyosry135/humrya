import 'package:example_structure/pages/match_details/bindings/match_details_binding.dart';
import 'package:example_structure/pages/match_details/presentation/views/match_details_view.dart';
import 'package:example_structure/widgets/next_match_item.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../widgets/home_appbar.dart';
import '../controllers/ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({Key? key}) : super(key: key);

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
                'التذاكر',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
      SizedBox(width: 20.w,)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 99.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(ColorCode.white),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 183.w,
                              child: CustomText(
                                'عند حجز التذاكر من على التطبيق يتم ادخال معلوماتك في سحب على جوائز عديدة ',
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff535353)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                        left: 20, child: Image(image: AppAssets.people))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                'المبارايات القادمة',
                textStyle: TextStyles.text16.copyWith(
                    fontSize: 17.sp, color: const Color(ColorCode.primary)),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) => InkWell(
                        onTap: () {
                          Get.to(() => MatchDetailsView(),binding: MatchDetailsBinding(),arguments: [controller.nextMatches.value![i]]);

                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.h),
                          child: NextMatchItem(
                              guestLogo: controller
                                      .nextMatches.value?[i].guest?.logo ??
                                  '',
                              hostLogo:
                                  controller.nextMatches.value?[i].host?.logo ??
                                      '',
                              title: controller.nextMatches.value?[i].gameTitle ??
                                  '',
                              time: controller.nextMatches.value?[i].time ?? '',
                              date: controller.nextMatches.value?[i].date ?? '',
                              guestName: controller
                                      .nextMatches.value?[i].guest?.title ??
                                  '',
                              hostName: controller
                                      .nextMatches.value?[i].host?.title ??
                                  '',
                              stadium:
                                  controller.nextMatches.value?[i].stadioum ??
                                      ''),
                        ),
                      ),
                  separatorBuilder: (ctx, i) => const SizedBox(),
                  itemCount: controller.nextMatches.value?.length ?? 0)
            ],
          ),
        ),
      ),
    );
  }
}
