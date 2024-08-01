import 'package:example_structure/pages/Marketing_and_investment/binding/Marketing_and_investment_binding.dart';
import 'package:example_structure/pages/Marketing_and_investment/presentation/views/Marketing_and_investment_Screen.dart';

import 'package:example_structure/pages/Media_Center/bindings/Media%20_Center%20_binding.dart';

import 'package:example_structure/pages/cultural_center/bindings/cultural_center_binding.dart';

import 'package:example_structure/pages/cultural_center/presentation/views/cultural_center_view.dart';
import 'package:example_structure/pages/football/bindings/football_binding.dart';
import 'package:example_structure/pages/football/presentations/views/football_view.dart';
import 'package:example_structure/pages/hamrya_club/binding/club_binding.dart';
import 'package:example_structure/pages/hamrya_club/presentation/views/club_view.dart';
import 'package:example_structure/pages/home/presentation/views/pdf_view_screen.dart';
import 'package:example_structure/pages/quality_policy/binding/policy_binding.dart';
import 'package:example_structure/pages/quality_policy/presentation/views/policy_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../resources/assets_generated.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../Media_Center/presentation/views/Media_Center_View.dart';
import '../../../../sports_game/binding/sportsgame_binding.dart';
import '../../../../sports_game/presentation/views/sportsgame_Screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 237.w,
      elevation: 0.0,
      backgroundColor: const Color(ColorCode.primary),
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AppAssets.logoX,
                height: 117.h,
                width: 102.w,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const ClubView(),
                    binding: ClubBinding(), transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'Alhamriyah culture & Sports Club',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => const FootballView(),
                    binding: FootballBinding(),
                    arguments: [2, 'كرة القدم'],
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'كرة القدم',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => const SportsgameScreen(),
                    binding: SportsgameBinding(),
                    arguments: [true],
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'الألعاب الرياضية',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => CulturalCenterView(),
                    binding: CulturalCenterBinding(),
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'المركز الثقافي',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => const MediaCenterView(),
                    binding: MediaCenterBinding(),
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'المركز الإعلامي',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => const MarketingandInvestmentScreen(),
                    binding: MarketingandInvestmentBinding(),
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'التسويق والاستثمار',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Get.to(() => const PolicyView(),
                    binding: PolicyBinding(context: context),
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                width: double.infinity,
                child: CustomText(
                  'سياسة الجودة',
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.text16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 175.w,
              height: 1.h,
              color: const Color(ColorCode.white).withOpacity(0.31),
            ),
            // SizedBox(height: 16.h),
            // InkWell(
            //   onTap: () {
            //     Get.to(PdfViewScreen());
            //   },
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: CustomText(
            //       'سياسة الخصوصية',
            //       textAlign: TextAlign.start,
            //       textStyle: TextStyles.text16
            //           .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
            //     ),
            //   ),
            // ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25.w,
                ),
                InkWell(
                  onTap: () {
                    _launchUrl('https://www.instagram.com/hcscae');
                  },
                  child: Image(
                    image: AppAssets.insta,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchUrl(
                        'https://www.facebook.com/alhamriyah.cultural.and.sports.club');
                  },
                  child: Image(
                    image: AppAssets.Facebook,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchUrl('https://twitter.com/hcscae');
                  },
                  child: Image(
                    image: AppAssets.twitter,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }
  }
}
