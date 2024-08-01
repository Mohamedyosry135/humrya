import 'package:example_structure/pages/periodic_table/presentation/controllers/periodic_table_controller.dart';
import 'package:get/get.dart';

class PeriodicTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PeriodicTableController());
  }
}