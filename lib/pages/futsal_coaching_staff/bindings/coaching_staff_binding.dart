import 'package:get/get.dart';

import '../presentation/controllers/coaching_staff_controller.dart';

class FutsalCoachingStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FutsalCoachingStaffController());
  }
}