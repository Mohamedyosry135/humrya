import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../controllers/login_controller.dart';

class ForgetPassword extends GetView<LogInController> {
  var phoneController = TextEditingController();
  var newPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int? pin = 0;

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppbar(
        height: 100.h,
        title: 'نسيت كلمه السر',
        onTap: () {
          Get.back();
        },
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(ColorCode.primary),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                'ادخل رقم هاتفك',
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => CustomTextFormField(
                  hint: 'رقم الهاتف',
                  onSave: (e) {},
                  enabled: controller.phoneEditable.value,
                  controller: phoneController,
                  validator: (v) {
                    if (v!.length != 10) {
                      return 'رقم الهاتف يجب ان يكون 10 ارقام';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Obx(
                () => controller.isResetPass.value == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                fillColor: const Color(ColorCode.white)
                                    .withOpacity(0.61),
                              ),
                              fieldWidth: 72.w,
                              margin: EdgeInsets.only(right: 4.w, top: 8),
                              numberOfFields: 4,

                              showFieldAsBox: true,
                              onCodeChanged: (String code) {

                              },

                              onSubmit: (String verificationCode) {
                                pin = int.parse(verificationCode);
                              }, // end onSubmit
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomText(
                            'كلمه السر الجديده',
                            textAlign: TextAlign.end,
                            textStyle: TextStyles.text22.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            hint: 'كلمه السر الجديدة',
                            isHiddenPassword: true,
                            obscureText: controller.hidePass.value,
                            onSave: (e) {},
                            validator: (v) {
                              if (v!.length < 8) {
                                return 'كلمةالسر قصيرة';
                              }
                              return null;
                            },
                            controller: newPassController,
                            inputType: TextInputType.text,
                            onTapShowHidePassword: () {
                              controller.hidePass.value = !controller.hidePass.value;
                            },
                            suffixIcon: InkWell(
                                onTap: () {
                                  controller.hidePass.value =
                                  !controller.hidePass.value;
                                },
                                child: const Icon(
                                  Icons.visibility,
                                  size: 24,
                                  color: Color(0xff808080),
                                )),
                          ),

                        ],
                      )
                    : const SizedBox(),
              ),
             const Spacer(),
              controller.obx(
                  (snap) => InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (controller.isResetPass.value == false) {
                              controller.sendOTP(
                                  {"phone_number": phoneController.text});
                            } else {
                              print('11');
                              if (pin.toString().length != 4) {
                                ToastWidget().showToast(context,
                                    message: 'ادخل كود التحقق',
                                    type: ToastTypes.info);
                              } else {
                               controller.resetPassword({
                                 "phone_number": phoneController.text,
                                 "password": newPassController.text,
                                 "otp": pin
                               },context);
                              }
                            }
                          }
                        },
                        child: CustomButtonContainer(
                          Center(
                              child: CustomText(
                            controller.isResetPass.value == true
                                ? 'تعيين كلمه السر'
                                : 'ارسال كود التحقق',
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
                                  width: 2)),
                        ),
                      ),
                  onLoading: const SpinKitCircle(
                    color: Colors.white,
                  )),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
