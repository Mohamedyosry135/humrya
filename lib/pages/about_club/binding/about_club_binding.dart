import 'package:example_structure/pages/about_club/presentation/controllers/about_club_controller.dart';
import 'package:get/get.dart';

class AboutClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutClubController());
  }
}