import 'package:example_structure/pages/first_team/presentation/controllers/first_team_controller.dart';
import 'package:get/get.dart';

class FirstTeamBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(FirstTeamController());
  }
}