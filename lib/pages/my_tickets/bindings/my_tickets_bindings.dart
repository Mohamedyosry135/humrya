import 'package:example_structure/pages/my_tickets/presentation/controllers/my_ticket_controller.dart';
import 'package:get/get.dart';

class MyTicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyTicketsController());
  }
}