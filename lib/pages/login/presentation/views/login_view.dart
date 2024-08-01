import 'package:example_structure/pages/login/presentation/controllers/login_controller.dart';
import 'package:example_structure/pages/login/presentation/views/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_form_field.dart';

class LogInView extends GetView<LogInController> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.h,
        title: 'تسجيل الدخول',
        onTap: () {
          Get.back();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(ColorCode.primary),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'مرحباً بعودتك',
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text22.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    hint: 'رقم الهاتف',
                    onSave: (e) {},
                    controller: phoneController,
                    validator: (v) {
                      if (v!.length != 10) {
                        return 'رقم الهاتف يجب ان يكون 10 ارقام';
                      }
                      return null;
                    },
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFormField(
                    hint: 'كلمة السر',
                    isHiddenPassword: true,
                    obscureText: controller.hidePass.value,
                    onSave: (e) {},
                    validator: (v) {
                      if (v!.length < 8) {
                        return 'كلمةالسر قصيرة';
                      }
                      return null;
                    },
                    controller: passwordController,
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
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (v) {
                              controller.rememberMeSwap();
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: const Color(ColorCode.white)
                                        .withOpacity(0.17),
                                    width: 1.w),
                                borderRadius: BorderRadius.circular(4)),
                            activeColor:
                                const Color(ColorCode.white).withOpacity(0.17),
                            checkColor:
                                const Color(ColorCode.white).withOpacity(0.4),
                          ),
                          CustomText(
                            'تذكرني',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ForgetPassword());
                            },
                            child: CustomText(
                              'نسيت كلمة السر؟',
                              textStyle: TextStyles.text16.copyWith(
                                  fontSize: 14.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(ColorCode.borderColor)),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  controller.obx(
                      (snap) => InkWell(
                            onTap: () {

                              if (formKey.currentState!.validate()) {
                                controller.signIn(
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                    context: context);
                              }
                            },
                            child: CustomButtonContainer(
                              Center(
                                  child: CustomText(
                                'تسجيل الدخول',
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
                    height: 182.h,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
