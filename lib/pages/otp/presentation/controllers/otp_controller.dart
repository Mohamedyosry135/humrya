import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:example_structure/pages/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../base/api_end_points.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/storage.dart';
import '../../../../consts/text_styles.dart';
import '../../../../services/dio_helper.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/toast_widget.dart';
import '../../../main/bindings/main_view_binding.dart';
import '../../../main/presentation/views/main_view.dart';

class OTPController extends SuperController<dynamic> {
  RxBool isResend = false.obs;
  GetStorage box = GetStorage();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  String verficationCode = "";

  Future verifyOTP({
    required String otp,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoints.VerifyOTP, data: {"phone_number": phone, "otp": otp});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      await  box.write(StorageKeys.token, response.data['access_token'].toString());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 48.0, top: 48),
                  child: CustomText(
                    'تم التحقق من رقم الهاتف',
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text22.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(ColorCode.primary),
                    ),
                  ),
                ),
                content: InkWell(
                  onTap: () {
                    // Get.rootDelegate.toNamed(Routes.MAIN);
                    Get.to(() =>  MainScreenView(),
                        binding: MainViewBinding());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: CustomButtonContainer(
                      Center(
                          child: CustomText(
                        'الذهاب إلى الرئيسية',
                        textStyle: TextStyles.text16.copyWith(),
                      )),
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.primary),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: const Color(ColorCode.primary), width: 2)),
                    ),
                  ),
                ),
              );
            });
      } else {
        ToastWidget().showToast(
          context,
          message: response.data['message'].toString(),
          type: ToastTypes.error,
        );
      }
    } catch (e) {
      if (e is DioError) {
        ToastWidget().showToast(
          context,
          message: e.response?.data['message'],
          type: ToastTypes.error,
        );
      }
    }
  }


  signup(BuildContext context) async{
    try {
      Response response = await DioHelper.postData(url: EndPoints.SignUp, data: {
        "first_name": Get.arguments["first_name"],
        "last_name": Get.arguments["last_name"],
        "phone_number": Get.arguments["phone"],
        "password": Get.arguments["password"]
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data['otp'].toString());
        verifyOTP(
          context: context,
          otp: response.data['otp'].toString(),
          phone: phoneController.text
        );

        // ToastWidget().showToast(
        //   context,
        //   message: response.data['message'].toString(),
        //   type: ToastTypes.success,
        // );
      } else {
        ToastWidget().showToast(
          context,
          message: response.data['message'].toString(),
          type: ToastTypes.error,
        );
      }
    } catch (e) {
      print(e.toString());
      if(e is DioError){
        ToastWidget().showToast(
          context,
          message: e.response?.data['message'],
          type: ToastTypes.error,
        );
      }
    }
  }

  @override
  void onInit() {
    phoneController.text = Get.arguments["phone"];
    pinController.text = Get.arguments["otp"];
    print("KKKKK " + phoneController.text);

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+971${phoneController.text}",
      // phoneNumber: '${widget.countryCode}${widget.phone["phone"]}',
      verificationCompleted: (credential) {},
      timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String? verificationId, int? forceResendingToken) {
        verficationCode = verificationId!;
      },
    );
    change(false, status: RxStatus.success());

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
