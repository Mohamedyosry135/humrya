import 'package:example_structure/models/home_model.dart';
import 'package:example_structure/pages/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class TicketController extends SuperController<dynamic> {
  Rx<List<UpcomingMatches>?> nextMatches =
      Get.find<HomeController>().homeModel.value.data!.upcomingMatches.obs;



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
