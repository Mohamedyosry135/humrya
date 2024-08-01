import 'package:dio/dio.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;

import '../../../../models/media_center_news_type_model.dart';

class MedianewsController extends SuperController<dynamic> {
  Rx<MediaCenterNewsTypeModel> newsType = MediaCenterNewsTypeModel().obs;
  Future fetchData()async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.getData(url: 'media-center/news-types');
      if(response.statusCode == 200){
        newsType.value = MediaCenterNewsTypeModel.fromJson(response.data);
        if(newsType.value.data?.isNotEmpty ?? false){
          change(true,status: RxStatus.success());
        }else{
          change(true,status: RxStatus.empty());
        }
      }else {
        change(false,status: RxStatus.error());
      }
    }catch(e){
      change(false,status: RxStatus.error());
      rethrow;
    }
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