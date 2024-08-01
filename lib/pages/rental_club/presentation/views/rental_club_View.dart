import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/rental_club/presentation/controllers/rental_club_controller.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../rental_hotel/bindings/rental_hotel_binding.dart';
import '../../../rental_hotel/presentation/views/rental_hotel_view.dart';

class RentalClubView extends GetView<RentalClubController> {
  bool isBack = false;
  RentalClubView({super.key, required this.isBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: HomeAppBar(
          height: 120.h,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 30.0.h, left: 30.w, right: 30.w, top: 66.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: SvgPicture.asset(AppSVGAssets.back),
                ),
                CustomText(
                  'حجز مرافق النــادي',
                  textAlign: TextAlign.center,
                  textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
                ),
                isBack == true
                    ? InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppSVGAssets.back))
                    : SizedBox(
                        width: 20.w,
                      ),
              ],
            ),
          ),
        ),
        body: controller.obx(
            (snap) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image(
                          image: AppAssets.hotel,
                          height: 180.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        'استمتع بمرافق نادي الحمريـــــة الثقافي الرياضي',
                        textAlign: TextAlign.center,
                        textStyle: TextStyles.text22.copyWith(
                            fontSize: 16.sp,
                            color: const Color(ColorCode.gold),
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GridView.builder(
                        primary: true,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 50 / 40,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              if (controller.facilities.value
                                      .data![index].id ==
                                  3) {
                                Get.to(
                                    () => RentalHotelView(
                                          isHotel: true,
                                          name: controller
                                                  .facilities
                                                  .value
                                                  .data![index]
                                                  .name ??
                                              '',
                                      image: controller
                                          .facilities
                                          .value
                                          .data![index].images?[0] ?? '',
                                        ),
                                    binding: RentalHotelBinding(),
                                    arguments: controller.facilities
                                        .value.data![index].id);
                              } else {
                                Get.to(
                                    () => RentalHotelView(
                                        isHotel: false,
                                        name: controller
                                                .facilities
                                                .value
                                                .data![index]
                                                .name ??
                                            '',
                                      image: controller
                                          .facilities
                                          .value
                                          .data![index].images?[0] ?? '',),
                                    binding: RentalHotelBinding(),
                                    arguments: controller.facilities
                                        .value.data![index].id);
                              }
                            },
                            child: Container(
                              height: 150.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(15.r),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                          .facilities
                                          .value
                                          .data![index]
                                          .images!
                                          .first,
                                      fit: BoxFit.fill,
                                      height: 150.h,
                                      width: 200.w,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child:
                                            CircularProgressIndicator(),
                                      ),
                                      key: UniqueKey(),
                                      colorBlendMode:
                                          BlendMode.colorDodge,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: const Color(ColorCode.primary).withOpacity(0.5)
                                    ),
                                    child: Center(
                                        child: CustomText(
                                      controller.facilities.value
                                              .data![index].name ??
                                          '',
                                      maxLines: 4,
                                      textStyle: TextStyles.text13
                                          .copyWith(
                                              fontSize: 20.sp,
                                              fontWeight:
                                                  FontWeight.w700,
                                              color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount:
                            controller.facilities.value.data?.length ??
                                0,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )),
            onLoading: const Center(
              child: SpinKitCircle(
                color: Color(ColorCode.primary),
              ),
            )));
  }
}
