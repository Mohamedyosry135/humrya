import 'package:example_structure/pages/summer_meeting/presentation/controllers/smmer_meet_controller.dart';
import 'package:get/get.dart';

class SummerMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SummerMeetingController());
  }
}