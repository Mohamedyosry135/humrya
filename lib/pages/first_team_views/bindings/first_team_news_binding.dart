import 'package:example_structure/pages/first_team_views/presentation/controllers/first_team_news_controller.dart';
import 'package:get/get.dart';

class FirstTeamNewsBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(FirstTeamNewsController());
  }
}