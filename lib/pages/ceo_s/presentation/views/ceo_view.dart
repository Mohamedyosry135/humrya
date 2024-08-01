import 'package:example_structure/pages/ceo_s/presentation/controllers/ceo_controller.dart';
import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';

class CeoView extends GetView<CeoController> {
  const CeoView({Key? key}) : super(key: key);

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
                'مجلس الإدارة',
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
                        Container(
                          height: 297.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(ColorCode.borderColor),
                                  width: 1.w),
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                          child: Column(
                            children: [

                              CustomNetworkImageWidget(
                                imageUrl:
                                controller.ceo.image ?? '',
                                height: 238.h,
                                width: 159.w,
                                fit: BoxFit.contain,
                                zoomFit: BoxFit.contain,
                                zoomWidth: 1.sw,
                                zoomHeight: 1.sh,
                              )
                            ,
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                controller.ceo.name ?? '',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(ColorCode.primary)),
                              ),
                              CustomText(
                                controller.ceo.position ?? '',
                                textStyle: TextStyles.text16.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff646464)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.55.r,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 24.h),
                          itemBuilder: (ctx, i) => Container(
                            height: 297.h,
                            width: 152.w,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(ColorCode.borderColor),
                                    width: 1.w),
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white),
                            child: Column(
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Column(
                                    children: [

                                      CustomNetworkImageWidget(
                                        imageUrl:
                                            controller.members[i].image ?? '',
                                        height: 217.h,
                                        width: 152.w,
                                        fit: BoxFit.cover,
                                        zoomFit: BoxFit.contain,
                                        zoomWidth: 1.sw,
                                        zoomHeight: 1.sh,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomText(
                                  'السيد / ${controller.members[i].name}',
                                  textStyle: TextStyles.text16.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(ColorCode.primary)),
                                ),
                                CustomText(
                                  '${controller.members[i].position}',
                                  maxLines: 1,
                                  textStyle: TextStyles.text16.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xff646464)),
                                ),
                              ],
                            ),
                          ),
                          itemCount: controller.members.length,
                        )
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
              )),
    );
  }
}
