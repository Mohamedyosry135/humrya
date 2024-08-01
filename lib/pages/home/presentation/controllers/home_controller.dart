
import 'package:dio/dio.dart';
import 'package:example_structure/models/home_model.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

class HomeController extends SuperController<dynamic> {
  Rx<HomeModel> homeModel = HomeModel().obs;
  List<QuestionsAnswer> questionsAnswers = <QuestionsAnswer>[];
  TextEditingController commentController = TextEditingController();
  RxBool isQuestionsLoading = false.obs;
  Future getHome() async {
    change(false, status: RxStatus.loading());
    try {
      Response response = await DioHelper.getData(
        url: 'home',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data['access_token'].toString());
        homeModel.value = HomeModel.fromJson(response.data);
        // Get.put(TicketController());
        // Get.find<TicketController>().nextMatches?.value = homeModel.value.data!.upcomingMatches!;
        print(response.data.toString());
        change(false, status: RxStatus.success());
        // ToastWidget().showToast(
        //   context,
        //   message: 'تم تسجيل الدخول بنجاح',
        //   type: ToastTypes.success,
        // );
      } else {}
    } catch (e) {
      print(e.toString());

        change(false, status: RxStatus.error());

      rethrow;
    }
  }

  Future saveQuestions() async {
    isQuestionsLoading.value = true;
    List answerData = [];
    questionsAnswers.forEach((element) {
      answerData.add(element.toJson());
    });

    try {
      Response response =
          await DioHelper.postData(url: 'questianer/1/answers', data: {
        "comment":
            commentController.text.isEmpty ? 'null' : commentController.text,
        "answers": answerData
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data.toString());
        isQuestionsLoading.value = false;
        ToastWidget()
            .showToast(Get.context!, message: 'تم', type: ToastTypes.success);
      } else {
        isQuestionsLoading.value = false;
        ToastWidget()
            .showToast(Get.context!, message: 'خطأ', type: ToastTypes.error);
      }
    } catch (e) {
      print(e.toString());
      isQuestionsLoading.value = false;
      if (e is DioError) {
        ToastWidget().showToast(Get.context!,
            message: 'dio error', type: ToastTypes.error);
        print(e.response?.data);
      } else {
        ToastWidget()
            .showToast(Get.context!, message: 'خطأ', type: ToastTypes.error);
      }
    }
  }

  @override
  void onInit() {
    getHome();
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
