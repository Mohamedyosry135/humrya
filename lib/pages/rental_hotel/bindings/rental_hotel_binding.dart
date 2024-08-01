import 'package:get/get.dart';

import '../presentation/controllers/rental_hotel_controller.dart';

class RentalHotelBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(RentalHotelController());
  }
}