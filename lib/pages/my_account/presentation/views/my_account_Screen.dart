import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/my_account/presentation/controllers/my_account_controller.dart';
import 'package:example_structure/pages/my_notification/bindings/my_notification_view_binding.dart';
import 'package:example_structure/pages/my_notification/presentation/views/my_notification_view.dart';
import 'package:example_structure/pages/my_setting/binding/my_setting_binding.dart';
import 'package:example_structure/pages/my_setting/presentation/views/my_setting_Screen.dart';
import 'package:example_structure/pages/my_tickets/bindings/my_tickets_bindings.dart';
import 'package:example_structure/pages/my_tickets/presentation/views/my_tickets_view.dart';
import 'package:example_structure/pages/onboarding/presentation/views/onboarding_view.dart';
import 'package:example_structure/pages/quality_policy/binding/policy_binding.dart';
import 'package:example_structure/pages/quality_policy/presentation/views/policy_view.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/routes/app_pages.dart';
import 'package:example_structure/widgets/custom_button_container.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAccountScreen extends GetView<MyAccountController> {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: HomeAppBar(
          height: 120.h,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 30.0.h, left: 30.w, right: 30.w, top: 66.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: SvgPicture.asset(AppSVGAssets.back),
                ),
                CustomText(
                  'حســابي',
                  textAlign: TextAlign.center,
                  textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
            ),
          ),
        ),
        body: controller.obx(
            (snap) => SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 24),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  '${controller.profile.value.data?.firstName} ${controller.profile.value.data?.lastName}',
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyles.text22.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(ColorCode.black)),
                                ),
                              ]),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            controller.profile.value.data?.phoneNumber ?? '',
                            textAlign: TextAlign.center,
                            textStyle: TextStyles.text22.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(ColorCode.grey1)),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                              width: double.infinity,
                              color:
                                  const Color(ColorCode.black).withOpacity(0.2),
                              height: 1),
                          const SizedBox(
                            height: 24,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => MyNotificationView(),
                                  binding: MyNotificationBinding());
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(ColorCode.primary)
                                          .withOpacity(0.1),
                                  child: const Image(
                                    image: AppAssets.frame,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: CustomText(
                                      'الإشعارات',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyles.text22.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(
                                              ColorCode.settingcolor)),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AppAssets.arrowSetting,
                                  width: 8,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => MySettingScreen(),
                                  binding: MySettingBinding(),
                                  arguments: [
                                    controller.profile.value.data?.firstName,
                                    controller.profile.value.data?.lastName,
                                    controller.profile.value.data?.phoneNumber,
                                    controller.profile.value.data?.email
                                  ]);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(ColorCode.primary)
                                          .withOpacity(0.1),
                                  child: const Image(
                                    image: AppAssets.settingIcon,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: CustomText(
                                      'الضبط',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyles.text22.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(
                                              ColorCode.settingcolor)),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AppAssets.arrowSetting,
                                  width: 8,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const MyTicketsView(),
                                  binding: MyTicketsBinding());
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(ColorCode.primary)
                                          .withOpacity(0.1),
                                  child: const Image(
                                    image: AppAssets.myTicket,
                                    height: 18,
                                    width: 28,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: CustomText(
                                      'تذاكـــري',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyles.text22.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(
                                              ColorCode.settingcolor)),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AppAssets.arrowSetting,
                                  width: 8,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(ColorCode.primary)
                                          .withOpacity(0.1),
                                  child: const Image(
                                    image: AppAssets.helpIcon,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: CustomText(
                                      'المساعدة',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyles.text22.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(
                                              ColorCode.settingcolor)),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AppAssets.arrowSetting,
                                  width: 8,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const PolicyView(),
                                  binding: PolicyBinding(context: context));
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(ColorCode.primary)
                                          .withOpacity(0.1),
                                  child: const Image(
                                    image: AppAssets.aboutIcon,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: CustomText(
                                      'عن التطبيق',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyles.text22.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(
                                              ColorCode.settingcolor)),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AppAssets.arrowSetting,
                                  width: 8,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              GetStorage().remove(StorageKeys.token);
                              Get.offNamed(Routes.ONBOARDING);
                            },
                            child: CustomButtonContainer(
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                      image: AppAssets.exit,
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Center(
                                          child: CustomText(
                                        'تسجيل الخروج',
                                        textStyle: TextStyles.text16.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(ColorCode.primary),
                                        ),
                                      )),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ),
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: const Color(ColorCode.primary)
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Get.dialog(
                                Center(
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Material(
                                      child: Container(
                                        width: 1.sw * 0.9,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'هل تريد حذف الحساب ؟',
                                              style: TextStyles.text16.copyWith(
                                                  fontSize: 18,
                                                  color: Colors.red),
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Obx(
                                              () => controller.deleteWaiting
                                                          .value ==
                                                      true
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.red,
                                                      ),
                                                    )
                                                  : CustomButtonContainer(
                                                      InkWell(
                                                          onTap: () {
                                                            controller
                                                                .deleteAccount();
                                                          },
                                                          child: const Center(
                                                              child: Text(
                                                            'حذف',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ))),
                                                      width: 1.sw * 0.6,
                                                      height: 50.h,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.r)),
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: CustomButtonContainer(
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: CustomText(
                                      'حذف الحساب',
                                      textStyle: TextStyles.text16.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(ColorCode.white),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
            onLoading: const Center(
              child: SpinKitDualRing(color: Color(ColorCode.primary)),
            ),
            onError: (e) => const Center(
                  child: Text('error'),
                )));
  }
}
