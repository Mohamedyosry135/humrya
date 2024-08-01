import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/controllers/individual_controller.dart';


class individualBinding extends Bindings {
  BuildContext context;
  individualBinding({required this.context});
  @override
  void dependencies() {
   Get.put(individualController()..getData(context));
  }

}