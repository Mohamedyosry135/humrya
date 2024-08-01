import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/login/bindings/login_binding.dart';
import 'package:example_structure/pages/login/presentation/views/login_view.dart';
import 'package:example_structure/pages/signup/presentation/controllers/signup_controller.dart';

import 'package:example_structure/resources/strings_generated.dart';
import 'package:example_structure/widgets/custom_appbar.dart';
import 'package:example_structure/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_button_container.dart';
import '../../../../widgets/custom_text.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final loginFocus = FocusNode();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.h,
        title: 'تسجيل مستخدم',
        onTap: () {
          Get.back();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(ColorCode.primary),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  AppStrings.hello,
                  textAlign: TextAlign.end,
                  textStyle: TextStyles.text22.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  color: const Color(ColorCode.orange),
                ),
                CustomTextFormField(
                  hint: 'الاسم الأول',
                  onSave: (e) {},
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ادخل الاسم الأول';
                    }
                    return null;
                  },
                  controller: firstNameController,
                  inputType: TextInputType.text,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  hint: 'الاسم الأخير',
                  onSave: (e) {},
                  controller: lastNameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ادخل الاسم الأخير';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  hint: 'رقم الهاتف',
                  onSave: (e) {},
                  controller: phoneController,
                  inputType: TextInputType.text,
                  validator: (v) {
                    if (v!.length != 10) {
                      return 'رقم الهاتف يجب ان يكون 10 ارقام';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    hint: 'كلمة السر',
                    onSave: (e) {},
                    isHiddenPassword: true,
                    obscureText: controller.hidePass.value,
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
                    validator: (v) {
                      if (v!.length < 8) {
                        return 'كلمه السر قصيرة';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                controller.obx(
                    (snap) =>  InkWell(
                    onTap: () {
                      // Get.rootDelegate.toNamed(Routes.OTP);
                      // Get.to(() => OTPView(),binding: OTPBinding());
                      if (formKey.currentState!.validate()) {
                        controller.signUp(
                            firstName: firstNameController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            lastName: lastNameController.text,
                            context: context);
                      }
                    },
                    child: CustomButtonContainer(
                      Center(
                          child: CustomText(
                        'تسجيل',
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
                  )
                ),
                SizedBox(
                  height: 182.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      'لديك حساب ؟',
                      textStyle: TextStyles.text16.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.rootDelegate.toNamed(Routes.LOGIN);
                        Get.to(() => LogInView(), binding: LogInBinding());
                      },
                      child: CustomText(
                        'تسجيل الدخول',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(ColorCode.borderColor)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
