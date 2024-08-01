import 'package:example_structure/pages/subscribe/presentation/controllers/subscribe_controller.dart';
import 'package:get/get.dart';

class SubscribeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SubscribeController());
  }
}