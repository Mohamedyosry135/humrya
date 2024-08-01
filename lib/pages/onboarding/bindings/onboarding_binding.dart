import 'package:get/get.dart';

import '../presentation/controllers/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
