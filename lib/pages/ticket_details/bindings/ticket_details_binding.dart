import 'package:example_structure/pages/ticket_details/presentaion/controller/ticket_details_controller.dart';
import 'package:get/get.dart';

class TicketDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TicketDetailsController());
  }
}