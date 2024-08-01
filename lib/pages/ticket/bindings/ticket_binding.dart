import 'package:example_structure/pages/ticket/presentation/controllers/ticket_controller.dart';
import 'package:get/get.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
  Get.lazyPut(() => TicketController());
  }

}