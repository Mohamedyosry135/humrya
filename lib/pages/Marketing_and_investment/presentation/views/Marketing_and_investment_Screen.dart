import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/Marketing_and_investment/presentation/controllers/Marketing_and_investment_controller.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/controller/main_controller.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/pages/rental_club/bindings/rental_club_binding.dart';
import 'package:example_structure/pages/rental_club/presentation/views/rental_club_View.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class MarketingandInvestmentScreen extends GetView<MarketingandInvestmentController> {
  const MarketingandInvestmentScreen({Key? key}) : super(key: key);

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
                'التسويق والاستثمار',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                  onTap: () {
                Get.to(() => const MainScreenView(),binding: MainViewBinding());
                    Get.find<MainViewController>().navController.value =
                        PersistentTabController(initialIndex: 2);
                    Get.find<MainViewController>().navIndex.value = 2;
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  InkWell(
                    onTap: (){

                      Get.to(() => RentalClubView(isBack: true),binding: RentalClubBinding());

                    },
                    child: Container(padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                 gradient: LinearGradient(

                     colors: [
                       const Color(ColorCode.primary),
                       const Color(ColorCode.primary).withOpacity(0.8),
                       const Color(ColorCode.primary),
                     ],
                 )
                        ),
                      child:  Image(
                image: AppAssets.rental,
                        fit: BoxFit.fitHeight,
                height: 65.h,
                width: 65.w,

              ),),
                  ),
                  const SizedBox(height: 8,),
                    CustomText(
                      'تأجير مرافق النــادي',
                      textAlign: TextAlign.center,
                      textStyle: TextStyles.text22.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w700,
                      color: const Color(ColorCode.gold)),
                    ),


                ],),
                const SizedBox(height: 20,),
                // Column(crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: (){},
                //       child: Container(padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                //             gradient: LinearGradient(
                //
                //               colors: [
                //                 const Color(ColorCode.primary),
                //                 const Color(ColorCode.primary).withOpacity(0.8),
                //                 const Color(ColorCode.primary),
                //               ],
                //             )
                //         ),
                //         child:  Image(
                //           image: AppAssets.request,
                //           fit: BoxFit.fitHeight,
                //           height: 65.h,
                //           width: 65.w,
                //
                //         ),),
                //     ),
                //     const SizedBox(height: 8,),
                //     CustomText(
                //       'طلب شريك إقليمي للنادي',
                //       textAlign: TextAlign.center,
                //       textStyle: TextStyles.text22.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w700,
                //           color: const Color(ColorCode.gold)),
                //     ),
                //
                //
                //   ],),
                // const SizedBox(height: 20,),
                // Column(crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: (){},
                //       child: Container(padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                //             gradient: LinearGradient(
                //
                //               colors: [
                //                 const Color(ColorCode.primary),
                //                 const Color(ColorCode.primary).withOpacity(0.8),
                //                 const Color(ColorCode.primary),
                //               ],
                //             )
                //         ),
                //         child:  Image(
                //           image: AppAssets.suggestions,
                //           fit: BoxFit.fitHeight,
                //           height: 65.h,
                //           width: 65.w,
                //
                //         ),),
                //     ),
                //     const SizedBox(height: 8,),
                //     CustomText(
                //       'الاقتراحات و الشكاوي و تقديم الخدمات',
                //       textAlign: TextAlign.center,
                //       textStyle: TextStyles.text22.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w700,
                //           color: const Color(ColorCode.gold)),
                //     ),
                //
                //
                //   ],),


          ]),
        ),
        ),
      )
    );
  }
}
