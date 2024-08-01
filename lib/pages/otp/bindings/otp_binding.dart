import 'package:get/get.dart';
import '../presentation/controllers/otp_controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OTPController());
  }
}
