import 'package:example_structure/models/albums_model.dart';
import 'package:get/get.dart';

import '../../../../services/dio_helper.dart';

class photoalbumsController extends SuperController<dynamic>{
Rx<AlbumsModel> albums = AlbumsModel().obs;
 Future fetchAlbums() async {
   change(false,status: RxStatus.loading());
   await DioHelper.getData(url: 'media-center/albums').then((value) {
   albums.value = AlbumsModel.fromJson(value.data);
   change(true,status: RxStatus.success());
   }).catchError((e){});
 }


  @override
  void onInit() {
 fetchAlbums();
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