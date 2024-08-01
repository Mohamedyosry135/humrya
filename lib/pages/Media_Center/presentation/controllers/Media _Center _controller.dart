import 'package:example_structure/models/media_center_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

class MediaCenterController extends SuperController<dynamic> {
  Rx<MediaCenterModel> mediaData = MediaCenterModel().obs;
  Future fetchData() async {
    change(false,status: RxStatus.loading());
    await DioHelper.getData(url: 'media-center')
        .then((value) {
          mediaData.value = MediaCenterModel.fromJson(value.data);
      change(false,status: RxStatus.success());
      print('done');
        })
        .catchError((e) {
          throw e;
    });
  }

  @override
  void onInit() {
    fetchData();
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
