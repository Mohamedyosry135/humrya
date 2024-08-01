import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../controllers/otp_controller.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  var OtpController = TextEditingController();
  int? pin;
  CountdownTimerController? timerController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.h,
        title: 'OTP',
        onTap: () {
          Get.back();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(ColorCode.primary),
      body: GetBuilder<OTPController>(
        builder: (controller){
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'رمز التحقق - OTP',
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text22.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomText(
                    'برجاء ادخال رمز التحقق في الرسالة النصية ',
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text22.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomText(
                    'رمز الـ OTP ',
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text22.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      hasCustomInputDecoration: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0.r),
                        ),
                        counterText: "",
                        helperText: null,
                        filled: true,
                        fillColor: const Color(ColorCode.white).withOpacity(0.61),
                      ),
                      fieldWidth: 40.w,
                      margin: EdgeInsets.only(right: 4.w, top: 8),
                      numberOfFields: 6,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.pinController.text = verificationCode;
                        // pin = int.parse(verificationCode);
                        // controller.verifyOTP(
                        //     otp: int.parse(verificationCode),
                        //     phone: controller.phoneController.text,
                        //     context: context);
                      }, // end onSubmit
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  InkWell(
                    onTap: () async{
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(verificationId: controller.verficationCode,smsCode: controller.pinController.text);
                      await FirebaseAuth.instance.signInWithCredential(credential) .then((value) {
                        controller.signup(context);

                      }).catchError((e) {
                        Get.snackbar("error", "code isnot valid");
                      });
                      // controller.verifyOTP(otp: pin!, phone: controller.phoneController.text, context: context);
                    },
                    child: CustomButtonContainer(
                      Center(
                          child: CustomText(
                            'تحقق',
                            textStyle: TextStyles.text16.copyWith(
                              color: const Color(ColorCode.primary),
                            ),
                          )),
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.white),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: const Color(ColorCode.borderColor),
                              width: 2.w)),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller.isResend.value == true) {

                            controller.isResend.value = false;
                            controller.endTime =
                                DateTime.now().millisecondsSinceEpoch + 1000 * 30;
                            controller.update();
                          }
                        },
                        child: CustomText(
                          'إعادة إرســال الرمز ',
                          textAlign: TextAlign.end,
                          textStyle: TextStyles.text13.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: GetBuilder<OTPController>(
                          builder: (snap) => CountdownTimer(
                            endTime: controller.endTime,
                            onEnd: () {
                              controller.isResend.value = true;
                            },
                            controller: timerController,
                            widgetBuilder: (context, CurrentRemainingTime? time) {
                              if (time == null) {
                                return const Text('00:00',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ));
                              }
                              return Text(
                                '${time.min ?? '00'} : ${time.sec}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 206.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        'ليس رقم هاتفي ؟ ',
                        textStyle: TextStyles.text16
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomText(
                          'تعديل الرقم',
                          textStyle: TextStyles.text16.copyWith(
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              color: const Color(ColorCode.borderColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


