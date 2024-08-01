import 'package:dio/dio.dart';
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/pages/onboarding/bindings/onboarding_binding.dart';
import 'package:example_structure/pages/onboarding/presentation/views/onboarding_view.dart';
import 'package:example_structure/pages/splash/data/splash_repository.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

class SplashController extends SuperController<dynamic> {
  SplashController({required this.splashRepository});

  final ISplashRepository splashRepository;
  GetStorage box = GetStorage();
  @override
  void onInit() async {
    super.onInit();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Future.delayed(const Duration(seconds: 2)).then((value) async {

      if (box.read(StorageKeys.token) != null) {
        try {
          Response response = await DioHelper.postData(url: 'auth/refresh');
          if (response.statusCode == 200) {
            await box.write(
                StorageKeys.token, response.data['access_token'].toString());
            print(response.data['access_token'].toString());
            Get.offAll(() => const MainScreenView(),
                binding: MainViewBinding());
          } else {
            Get.offAll(() => const OnBoardingView(),
                binding: OnBoardingBinding());
           await box.remove(StorageKeys.token);
          }
        } catch (e) {
          await box.remove(StorageKeys.token);
          Get.offAll(() => const OnBoardingView(),
              binding: OnBoardingBinding());
        }
      } else {
        Get.offAll(() => const OnBoardingView(), binding: OnBoardingBinding());
      }


    });
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
