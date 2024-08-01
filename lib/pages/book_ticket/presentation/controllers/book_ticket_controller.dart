import 'package:dio/dio.dart';
import 'package:example_structure/models/home_model.dart';
import 'package:example_structure/pages/confirm_booking/presentation/view/confirm_booking.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:image_picker/image_picker.dart';

class BookTicketController extends SuperController<dynamic> {
  RxBool isResend = false.obs;
  XFile? imageId;
  RxBool isHost = true.obs;
  UpcomingMatches? match;


  Future bookTicket({required FormData formData,required BuildContext context}) async {
    change(false,status: RxStatus.loading());
    await DioHelper.postData(url: 'matche/${match!.id}/reserve', data: formData)
        .then((value) {
      if(value.statusCode == 200 || value.statusCode == 201){
        change(false,status: RxStatus.success());
        ToastWidget().showToast(context,
            message: 'تم الحجز بنجاح',
            type: ToastTypes.success);
        Get.to(const ConfirmBookingView());
      }else{
        change(false,status: RxStatus.success());
        print(value.data);
      }
    }).catchError((e) {
      change(false,status: RxStatus.success());
      if(e is DioError){
        ToastWidget().showToast(context,
            message: e.response?.data['message'],
            type: ToastTypes.error);
        print(e.response?.data['message']);
      }
    });
  }
  @override
  void onInit() {
   match = Get.arguments[0];
   change(true,status: RxStatus.success());
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