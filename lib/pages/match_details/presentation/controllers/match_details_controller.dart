

import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';

import '../../../../models/home_model.dart';

class MatchDetailsController extends SuperController<dynamic> {
  RxBool isResend = false.obs;
  XFile? imageId;
  RxBool isHost = true.obs;

  int? endTime;
  UpcomingMatches? match;




  @override
  void onInit() {
    match = Get.arguments[0];
    endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * match!.remainingTime!;
    change(false,status: RxStatus.success());
    super.onInit();
  }

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
