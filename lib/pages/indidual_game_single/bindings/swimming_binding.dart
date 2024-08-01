import 'package:get/get.dart';

import '../presentation/controllers/swimming_controller.dart';

class SingleIndidualGameBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SingleIndividualGameController());
  }
}