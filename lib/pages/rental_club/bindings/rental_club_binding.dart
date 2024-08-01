import 'package:get/get.dart';

import '../presentation/controllers/rental_club_controller.dart';

class RentalClubBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => RentalClubController());
  }
}