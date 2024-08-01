import 'package:example_structure/models/single_album_model.dart';
import 'package:example_structure/models/single_individual_game_photos.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart';

class MediagaleryController extends SuperController<dynamic> {
  int? id;
  Rx<SingleAlbumModel> album = SingleAlbumModel().obs;
  Rx<SingleIndividualGamePhotosModel> singleIndividualGamePhotos = SingleIndividualGamePhotosModel().obs;

  bool? isMediaCenter;
  Future fetchData() async {
    if (isMediaCenter == true) {
      change(false, status: RxStatus.loading());
      await DioHelper.getData(url: 'media-center/albums/$id').then((value) {
        album.value = SingleAlbumModel.fromJson(value.data);
        change(false, status: RxStatus.success());
      }).catchError((e) {
        change(false, status: RxStatus.error(e.toString()));
        throw e;
      });
    } else if(isMediaCenter == false) {

      change(false, status: RxStatus.loading());
      await DioHelper.getData(url: 'individual_games/$id/photos').then((value) {
        singleIndividualGamePhotos.value = SingleIndividualGamePhotosModel.fromJson(value.data);
        change(false, status: RxStatus.success());
      }).catchError((e) {
        change(false, status: RxStatus.error(e.toString()));
        throw e;
      });
    }else {}
  }

  @override
  void onInit() {
    id = Get.arguments[0];
    isMediaCenter = Get.arguments[1];
    print(isMediaCenter);

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
