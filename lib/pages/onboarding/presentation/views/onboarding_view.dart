import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/login/bindings/login_binding.dart';
import 'package:example_structure/pages/login/presentation/views/login_view.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/pages/signup/bindings/signup_binding.dart';
import 'package:example_structure/pages/signup/presentation/views/signup_view.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/resources/strings_generated.dart';
import 'package:example_structure/routes/app_pages.dart';
import 'package:example_structure/widgets/custom_button.dart';
import 'package:example_structure/widgets/custom_button_container.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ColorCode.primary),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(ColorCode.primary),
          ),
          backgroundColor: const Color(ColorCode.primary),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AppAssets.logo,
                    height: 252.h,
                    width: 222.w,
                  ),
                ),
                SizedBox(
                  height: 53.h,
                ),
                CustomText(
                  'نـــادي الحمريــة الثقـافي الريــاضي',
                  textStyle:
                      TextStyles.text25.copyWith(color: const Color(ColorCode.white)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomText(
                  'Alhamriyah culture & Sports Club',
                  textStyle: TextStyles.text25.copyWith(
                      color: const Color(ColorCode.white),
                      fontSize: 20.sp,
                      height: 0,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(
                      Routes.LOGIN,
                    );
                  },
                  child: CustomButtonContainer(
                    Center(
                        child: CustomText(
                      'تسجيل الدخول',
                      textStyle: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.primary),
                      ),
                    )),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.white),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: const Color(ColorCode.borderColor), width: 2)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                StreamBuilder(
                  stream: controller.dbRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitCircle(color: Color(ColorCode.gray)),
                      );
                    }else{
                      dynamic data = (snapshot.data?.snapshot.value);
                      if(data.toString() == "1"){
                        return Row(
                          children: [
                            Expanded(
                              child: controller.obx((state) => CustomButtonContainer(
                                CustomButton(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppSVGAssets.getWidget(AppSVGAssets.google,height: 30,
                                        width: 30,),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: CustomText(
                                            "سجل  بجوجل",
                                            textStyle: TextStyles.text16.copyWith(
                                                color: Color(ColorCode.black),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                      ()  {
                                    controller.signInWithGoogle(context);
                                  },
                                  backGroundColor: Color(ColorCode.white),
                                ),
                                width: double.infinity,
                                height: 50.h,
                              ),onLoading: Center(child: const CircularProgressIndicator())),

                            ),
                            // SizedBox(
                            //   width: 12.w,
                            // ),
                            // Expanded(
                            //   child: controller.obx((state) => CustomButtonContainer(
                            //     CustomButton(
                            //       Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Image(
                            //             image: AppAssets.appleLogo,
                            //             height: 30,
                            //             width: 30,
                            //           ),
                            //           SizedBox(
                            //             width: 12.w,
                            //           ),
                            //           Container(
                            //             margin: EdgeInsets.only(bottom: 5),
                            //             child: CustomText(
                            //                 "سجل  بأبل",
                            //                 textStyle: TextStyles.text16.copyWith(
                            //                     color: Color(ColorCode.black),
                            //                     fontWeight: FontWeight.w500,
                            //                     fontSize: 16.sp
                            //                 )
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //           ()  {
                            //         controller.signInWithApple(context);
                            //       },
                            //
                            //       backGroundColor: Color(ColorCode.white),
                            //     ),
                            //     width: double.infinity,
                            //     height: 50.h,
                            //   ),onLoading: Center(child: const CircularProgressIndicator())),
                            //
                            // ),
                          ],
                        );
                      }else{
                        return SizedBox(height: 0,width: 0,);
                      }
                    }

                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: (){
                    // Get.rootDelegate.toNamed(Routes.SIGNUP);
                    Get.to(() => SignUpView(),binding: SignUpBinding());
                  },
                  child: CustomText(
                    'مستخدم جديد؟ تسجيل',
                    textStyle: TextStyles.text16.copyWith(
                      color: const Color(ColorCode.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: (){
                    // Get.rootDelegate.toNamed(Routes.MAIN);
                    Get.to(() => const MainScreenView(),binding: MainViewBinding());
                  },
                  child: CustomText(
                    'الدخول كـزائر',
                    textStyle: TextStyles.text16.copyWith(
                        color: const Color(ColorCode.white),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
