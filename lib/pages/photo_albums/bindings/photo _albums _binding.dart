import 'package:get/get.dart';

import '../presentation/controllers/photo _albums .dart';

class photoalbumsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(photoalbumsController());
  }
}