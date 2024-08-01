import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../controllers/coaching_staff_controller.dart';
import 'widgets/coaching_staff_item.dart';

class FutsalCoachingStaffView extends GetView<FutsalCoachingStaffController> {


const FutsalCoachingStaffView({super.key});
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
                'الجهاز الفني',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                    // PersistentNavBarNavigator.pushNewScreen(
                    //   context,
                    //   screen:  backWidget!,
                    //   withNavBar: true, // OPTIONAL VALUE. True by default.
                    //   pageTransitionAnimation:
                    //   PageTransitionAnimation.fade,
                    // );
                    // Get.find<MainViewController>().navController.value =
                    //     PersistentTabController(initialIndex: 2);
                    // Get.find<MainViewController>().navIndex.value = 2;
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
        child:
        GridView.count(
          physics: const BouncingScrollPhysics(),
          childAspectRatio: .7,
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 16.h,
          children: <Widget>[
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),
            CoachingStaffitem(  height: 146.28.h,
              width: 98.w,),


            


          ],
        ),
      ),
    );
  }
}
