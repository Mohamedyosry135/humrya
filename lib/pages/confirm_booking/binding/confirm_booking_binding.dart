import 'package:get/get.dart';

import '../presentation/controllers/confirm_booking_controller.dart';

class ConfirmBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConfirmBookingController());
  }
}