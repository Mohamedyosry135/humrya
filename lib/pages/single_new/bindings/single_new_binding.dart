import 'package:example_structure/pages/single_new/presentation/controllers/single_new_controller.dart';
import 'package:get/get.dart';

class SingleNewBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SingleNewController());
  }
}