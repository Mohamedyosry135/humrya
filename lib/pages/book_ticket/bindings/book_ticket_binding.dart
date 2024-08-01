import 'package:example_structure/pages/book_ticket/presentation/controllers/book_ticket_controller.dart';
import 'package:get/get.dart';

class BookTicketBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(BookTicketController());
  }

}