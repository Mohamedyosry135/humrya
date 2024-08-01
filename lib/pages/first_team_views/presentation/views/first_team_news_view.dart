import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/pages/first_team_views/presentation/controllers/first_team_news_controller.dart';
import 'package:example_structure/pages/single_new/bindings/single_new_binding.dart';
import 'package:example_structure/pages/single_new/presentation/views/single_vew_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../../../../widgets/news_widget.dart';

class FirstTeamNewsView extends GetView<FirstTeamNewsController> {
  Widget? backwadget;
  String? title;
  FirstTeamNewsView({
    Key? key,
    this.backwadget,
    this.title,
  }) : super(key: key);

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
                'أخبار ${controller.title}',
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
                    EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 22.w),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctx, i) => InkWell(
                                onTap: () {
                                  Get.to(
                                      () => SingleNewView(
                                          title: controller
                                                  .news.value.data?[i].title ??
                                              '',
                                          content: controller.news.value
                                                  .data?[i].content ??
                                              '',
                                          date: controller.news.value.data?[i]
                                                  .createdAt ??
                                              '',
                                          imageUrl: controller
                                                  .news.value.data?[i].image ??
                                              ''),
                                      binding: SingleNewBinding());
                                },
                                child: NewsWidget(
                                    imageurl:
                                        controller.news.value.data?[i].image ??
                                            '',
                                    content: controller
                                            .news.value.data?[i].content ??
                                        '',
                                    date: controller
                                            .news.value.data?[i].createdAt ??
                                        '',
                                    title:
                                        controller.news.value.data?[i].title ??
                                            '')),
                            separatorBuilder: (ctx, i) => SizedBox(
                                  height: 16.h,
                                ),
                            itemCount: controller.news.value.data?.length ?? 0)
                      ],
                    )),
              ),
          onLoading: const Center(
            child: SpinKitChasingDots(
              color: Color(ColorCode.primary),
            ),
          ),
          onEmpty: Center(child: CustomText('لا يوجد اخبار',textStyle: TextStyles.text16.copyWith(
            color: const Color(ColorCode.primary)
          ),))),
    );
  }
}
