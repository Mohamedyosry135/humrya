import 'package:dio/dio.dart';
import 'package:example_structure/models/my_tickets_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:get/get.dart' hide Response;

class MyTicketsController extends SuperController<dynamic> {
  Rx<MyTicketsModel> tickets = MyTicketsModel().obs;
  Future fetchData() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(url: 'my-tickets');
      if (response.statusCode == 200) {
        tickets.value = MyTicketsModel.fromJson(response.data);
        change(false, status: RxStatus.success());
        print(response.statusCode);
      } else {
        change(false, status: RxStatus.success());
        print(response.statusCode);
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
