import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/pages/splash/presentation/controllers/splash_controller.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorCode.gray),
      body: Center(
          child: Image(
        image: AppAssets.splash,
        height: 408.h,
        width: 314.w,
      )),
    );
  }
}
