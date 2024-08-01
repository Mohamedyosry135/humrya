import 'package:example_structure/pages/choose_play/presentations/views/widget/choose_play_widget.dart';
import 'package:example_structure/pages/subscribe/bindings/subscribe_binding.dart';
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
import '../../../subscribe/presentation/views/subscribe_view.dart';
import '../controllers/choose_play_controller.dart';

class ChoosePlayView extends GetView<ChoosePlayController> {
  List<String> titles = [
    'القوس والسهم',
    'التجديف',
    'التجديف',
    'التجديف',
    'التجديف',
    'التجديف',
    'التجديف',
    'التجديف',
    'التجديف',
  ];
  Widget? backwidget;

  ChoosePlayView({
    super.key,
    this.backwidget,
  });

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
                'التسجيل فالألعاب',
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
                        CustomText(
                          'أختــر الرياضة',
                          textStyle: TextStyles.text16.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(ColorCode.primary)),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctx, i) => InkWell(
                                onTap: () {
                                  Get.to(
                                      SubscribeView(
                                        title: controller.academies.value
                                                .data?[i].name ??
                                            '',
                                        id: controller
                                                .academies.value.data?[i].id ??
                                            0,
                                      ),
                                      binding: SubscribeBinding(),
                                      arguments: [
                                        controller.academies.value.data?[i].id,
                                        false,
                                        false
                                      ],transition: Transition.fadeIn);
                                },
                                child: chooseplayWidget(
                                    controller.academies.value.data?[i].name ??
                                        '')),
                            separatorBuilder: (ctx, i) => SizedBox(
                                  height: 16.h,
                                ),
                            itemCount:
                                controller.academies.value.data?.length ?? 0)
                      ],
                    )),
              ),
          onLoading: const Center(
            child: SpinKitDualRing(
              color: Color(ColorCode.primary),
            ),
          )),
    );
  }
}
