import 'package:get/get.dart';

import '../presentation/controllers/my_notification_view_controller.dart';

class MyNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyNotificationController());
  }
}