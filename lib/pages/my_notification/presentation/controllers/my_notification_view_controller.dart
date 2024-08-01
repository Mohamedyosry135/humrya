import 'package:dio/dio.dart';
import 'package:example_structure/models/notification_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class MyNotificationController extends SuperController<dynamic> {
  ScrollController? scrollController = ScrollController();
  RxInt currentPage = 1.obs;
  Rx<NotificationModel> notificationsModel = NotificationModel().obs;
  RxList<NotificatioData> notifications = <NotificatioData>[].obs;
  RxBool isFirstLoading = true.obs;
  RxBool isLoading = true.obs;
  RxBool hasMore = true.obs;
  Future fetchData() async {
    isLoading.value = true;
    try {
      Response response = await DioHelper.getData(
          url: 'notification?page=${currentPage.value}');
      if (response.statusCode == 200) {
        notificationsModel.value = NotificationModel.fromJson(response.data);
        notificationsModel.value.data?.data?.forEach((element) {
          notifications.add(element);
        });
        isLoading.value = false;
        isFirstLoading.value = false;
        if (currentPage.value < notificationsModel.value.data!.lastPage!) {
          currentPage.value++;
        } else {
          hasMore.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      isFirstLoading.value = false;
      print(e.toString());
    }
  }
  Future readOneNotification(int id)async {
    isFirstLoading.value = true;
    try{
      Response response = await DioHelper.postData(url: 'notification/read/$id');
      if(response.statusCode == 200){
        notifications.clear();
        fetchData();
        isFirstLoading.value = false;
      }
    }catch(e){
      isFirstLoading.value = false;
    }
  }
  Future readAllNotification()async {
    isFirstLoading.value = true;
    try{
      Response response = await DioHelper.postData(url: 'notification/readall');
      if(response.statusCode == 200){
        notifications.clear();
       await fetchData();
        isFirstLoading.value = false;
      }
    }catch(e){
      isFirstLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchData();
    scrollController!.addListener(() {
      double maxScroll = scrollController!.position.maxScrollExtent;
      // print('offset ${scrollController!.offset}');
      // print('max $maxScroll');

      if (scrollController!.offset > maxScroll * 0.8 &&
          isLoading.value == false &&
          hasMore.value == true) {
        fetchData();
      }
    });
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
