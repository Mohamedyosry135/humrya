import 'package:example_structure/pages/my_setting/presentation/controllers/my_setting_controller.dart';
import 'package:get/get.dart';



class MySettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MySettingController());
  }

}