import 'package:example_structure/pages/quality_policy/presentation/controllers/policy_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PolicyBinding extends Bindings {
  BuildContext context;
  PolicyBinding({required this.context});
  @override
  void dependencies() {
  Get.put(PolicyCintroller()..getData(context));
  }
}