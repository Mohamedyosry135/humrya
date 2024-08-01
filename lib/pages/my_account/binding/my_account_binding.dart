import 'package:example_structure/pages/my_account/presentation/controllers/my_account_controller.dart';
import 'package:get/get.dart';



class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountController());
  }

}