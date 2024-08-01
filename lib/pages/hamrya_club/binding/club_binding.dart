import 'package:get/get.dart';

import '../presentation/controllers/club_controller.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(ClubController());
  }

}