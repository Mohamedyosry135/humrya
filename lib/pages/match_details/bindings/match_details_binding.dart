import 'package:example_structure/pages/match_details/presentation/controllers/match_details_controller.dart';
import 'package:get/get.dart';


class MatchDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(MatchDetailsController());
  }
}
