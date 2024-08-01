import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../../models/news_model.dart';
import '../../../../services/dio_helper.dart';

class FirstTeamNewsController extends SuperController<dynamic> {
  String? title;
  dynamic id;
  bool isMediaCenter = false;
Rx<NewsModel> news = NewsModel().obs;
  Future fetchData() async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.getData(url: 'team/$id/news');
      if(response.statusCode == 200){

      news.value = NewsModel.fromJson(response.data);
        change(true,status: RxStatus.success());
      }
    }catch(e){

      if(e is DioError){
        print(e.response?.data);
      }

      change(true,status: RxStatus.success());
      rethrow;
    }
  }
  Future fetchMediaData() async {
    change(false,status: RxStatus.loading());
    try{
      Response response = await DioHelper.getData(url: 'media-center/news/$id');
      if(response.statusCode == 200){

        news.value = NewsModel.fromJson(response.data);
      if(news.value.data?.isNotEmpty ?? false){
        change(true,status: RxStatus.success());
      }else {
        change(true,status: RxStatus.empty());
      }
      }
    }catch(e){

      if(e is DioError){
        print(e.response?.data);
      }

      change(true,status: RxStatus.success());
      rethrow;
    }
  }




  @override
  void onInit() {
    title =  Get.arguments[0];
    id = Get.arguments[1];
    isMediaCenter  = Get.arguments[2];
    if(isMediaCenter == false ){
      fetchData();
    }else {
      fetchMediaData();
    }

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