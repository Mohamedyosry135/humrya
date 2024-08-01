import 'package:dio/dio.dart';
import 'package:example_structure/models/single_team_game_team.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;

class GoalsController extends SuperController<dynamic> {
  int? id;
  bool? isMediaCenter;
  RxList<VideosModel> videos = <VideosModel>[].obs;
  Future fetchData() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(url: 'team/$id/goals');
      if (response.statusCode == 200) {
        response.data['data'].forEach((e) {
          videos.add(VideosModel.fromJson(e));
        });
        change(false, status: RxStatus.success());
      } else {
        change(false, status: RxStatus.success());
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      change(false, status: RxStatus.success());
      rethrow;
    }
  }

  Future fetchMediaCenterData() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(url: 'media-center/videos');
      if (response.statusCode == 200) {
        response.data['videos'].forEach((e) {
          videos.add(VideosModel.fromJson(e));
        });
        change(false, status: RxStatus.success());
      } else {
        change(false, status: RxStatus.success());
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      change(false, status: RxStatus.success());
      rethrow;
    }
  }

  @override
  void onInit() {
    id = Get.arguments[0];
    isMediaCenter = Get.arguments[1];
    if (isMediaCenter == true) {
      fetchMediaCenterData();
    } else {
      fetchData();
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
