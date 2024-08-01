import 'package:get/get.dart';

class SportsgameController extends SuperController<dynamic> {
  bool isBack = false;
  bool toRegister = false;
  @override
  void onInit() {
    if (Get.arguments != null) {
      isBack = Get.arguments[0];
    }
    super.onInit();
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
