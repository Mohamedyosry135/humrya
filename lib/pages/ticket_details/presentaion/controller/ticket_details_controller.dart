import 'package:example_structure/models/my_tickets_model.dart';
import 'package:get/get.dart';

class TicketDetailsController extends SuperController<dynamic> {
  TicketData? ticket ;

  @override
  void onInit() {
   ticket = Get.arguments[0];
    super.onInit();
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}