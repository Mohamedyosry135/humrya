import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/models/home_model.dart';
import 'package:example_structure/pages/choose_play/bindings/choose_play_binding.dart';
import 'package:example_structure/pages/home/presentation/controllers/home_controller.dart';
import 'package:example_structure/pages/home/presentation/views/widgets/drawer.dart';
import 'package:example_structure/pages/main/presentation/controller/main_controller.dart';
import 'package:example_structure/pages/main/presentation/views/widgets/match_item.dart';
import 'package:example_structure/pages/match_details/bindings/match_details_binding.dart';
import 'package:example_structure/pages/my_notification/bindings/my_notification_view_binding.dart';
import 'package:example_structure/pages/my_notification/presentation/views/my_notification_view.dart';
import 'package:example_structure/pages/photo_albums/bindings/photo%20_albums%20_binding.dart';
import 'package:example_structure/pages/photo_albums/presentation/views/photo_albums_View.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/resources/assets_svg_generated.dart';
import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/custom_text_form_field.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/custom_button_container.dart';
import '../../../choose_play/presentations/views/choose_play_view.dart';
import '../../../match_details/presentation/views/match_details_view.dart';
import '../../../single_new/bindings/single_new_binding.dart';
import '../../../single_new/presentation/views/single_vew_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffF5F5F5),
      appBar: HomeAppBar(
        height: 150.h,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 33.0.h, left: 30.w, right: 30.w, top: 62.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: SvgPicture.asset(AppSVGAssets.menu)),
              SizedBox(
                width: 18.w,
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => MyNotificationView(),
                        binding: MyNotificationBinding());
                  },
                  child: SvgPicture.asset(AppSVGAssets.notification)),
              const Spacer(),
              Image(
                image: AppAssets.logo,
                height: 60.h,
                width: 52.w,
              )
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: controller.obx(
          (snap) => Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'الأخبار',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 17.sp,
                            color: const Color(ColorCode.primary)),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 175.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctx, i) => Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 172.h,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color:
                                            const Color(ColorCode.borderColor),
                                        width: 1,
                                      )),
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Stack(
                                      children: [
                                        CustomNetworkImageWidget(
                                          imageUrl: controller.homeModel.value
                                                  .data?.news?[i].image ??
                                              '',
                                          fit: BoxFit.fill,
                                          width: 1.sw * 0.9,
                                          height: 170.h,
                                          onTap: () {
                                            Get.to(
                                                () => SingleNewView(
                                                    title: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.news?[i]
                                                            .title ??
                                                        '',
                                                    content: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.news?[i]
                                                            .content ??
                                                        '',
                                                    date: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.news?[i]
                                                            .createdAt ??
                                                        '',
                                                    imageUrl: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.news?[i]
                                                            .image ??
                                                        ''),
                                                binding: SingleNewBinding());
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                                horizontal: 10.w),
                                            width: double.infinity,
                                            color:
                                                Colors.black.withOpacity(0.65),
                                            child: CustomText(
                                              controller.homeModel.value.data
                                                      ?.news?[i].title ??
                                                  '',
                                              textStyle: TextStyles.text11
                                                  .copyWith(
                                                      fontSize: 10.sp,
                                                      height: 1.5.h),
                                              maxLines: 5,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (ctx, i) => const SizedBox(
                                  width: 12,
                                ),
                            itemCount:
                                controller.homeModel.value.data?.news?.length ??
                                    0),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      CustomText(
                        'المبارايات القادمة',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 17.sp,
                            color: const Color(ColorCode.primary)),
                      ),
                      SizedBox(
                        height: controller.homeModel.value.data?.upcomingMatches
                                    ?.isNotEmpty ??
                                false
                            ? 170.h
                            : 70.h,
                        child: controller.homeModel.value.data?.upcomingMatches
                                    ?.isNotEmpty ??
                                false
                            ? ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) => InkWell(
                                  onTap: () {
                                    Get.to(() => MatchDetailsView(),
                                        binding: MatchDetailsBinding(),
                                        arguments: [
                                          controller.homeModel.value.data
                                              ?.upcomingMatches?[i]
                                        ]);
                                  },
                                  child: MatchItem(
                                    date: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].date,
                                    guest: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].guest?.title,
                                    guestLogo: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].guest?.logo,
                                    host: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].host?.title,
                                    hostLogo: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].host?.logo,
                                    time: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].time,
                                    gameTitle: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].stadioum,
                                    title: controller.homeModel.value.data
                                        ?.upcomingMatches?[i].gameTitle ?? '',
                                  ),
                                ),
                                separatorBuilder: (ctx, i) => const SizedBox(
                                  width: 16,
                                ),
                                itemCount: controller.homeModel.value.data
                                        ?.upcomingMatches?.length ??
                                    0,
                              )
                            : Center(
                                child: CustomText(
                                  'لا توجد مباريات',
                                  textStyle: TextStyles.text16.copyWith(
                                      color: const Color(ColorCode.primary)),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        'انجازات النادي',
                        textStyle: TextStyles.text16.copyWith(
                            fontSize: 17.sp,
                            color: const Color(ColorCode.primary)),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 170.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 170.h,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color:
                                            const Color(ColorCode.borderColor),
                                        width: 1.w,
                                      )),
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Stack(
                                      children: [
                                        CustomNetworkImageWidget(
                                          imageUrl: controller
                                                  .homeModel
                                                  .value
                                                  .data
                                                  ?.achievements?[i]
                                                  .image ??
                                              '',
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                              height: 75.h,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 10.w),
                                              width: double.infinity,
                                              color: Colors.black
                                                  .withOpacity(0.65),
                                              child: CustomText(
                                                controller
                                                        .homeModel
                                                        .value
                                                        .data
                                                        ?.achievements?[i]
                                                        .title ??
                                                    '',
                                                textStyle: TextStyles.text13
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.5.h),
                                                textAlign: TextAlign.start,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (ctx, i) => SizedBox(
                                  width: 16.w,
                                ),
                            itemCount: controller.homeModel.value.data
                                    ?.achievements?.length ??
                                0),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ChoosePlayView(),
                              binding: chooseplayBinding(),
                              transition: Transition.fadeIn);
                        },
                        child: SizedBox(
                          height: 120.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 97.h,
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: const Color(ColorCode.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        'سجل في اكاديميات النادي',
                                        textAlign: TextAlign.start,
                                        textStyle: TextStyles.text16.copyWith(
                                            color:
                                                const Color(ColorCode.primary)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        width: 185.w,
                                        child: CustomText(
                                          'الان يمكنك التسجيل في الاكاديمية الرياضية في النادي، واختيار رياضتك المفضلة ',
                                          textStyle: TextStyles.text11.copyWith(
                                              fontSize: 10.sp,
                                              height: 1.5.h,
                                              fontWeight: FontWeight.w300,
                                              color: const Color(0xff2B2B2B)),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                  top: 0,
                                  end: 15,
                                  child: Image(
                                    image: AppAssets.stadium,
                                    height: 94.h,
                                    width: 133.w,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'معرض الصور',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 17.sp,
                                color: const Color(ColorCode.primary)),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => photoAlbumsView(),
                                  binding: photoalbumsBinding(),
                                  transition: Transition.fadeIn);
                            },
                            child: CustomText(
                              'المزيد',
                              textStyle: TextStyles.text16.copyWith(
                                  fontSize: 13.sp,
                                  color: const Color(ColorCode.primary)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 115.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: controller.homeModel.value.data!.gallery!
                              .map(
                                (e) => Container(
                                    height: 115,
                                    width: 187.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: CustomNetworkImageWidget(
                                      imageUrl: e.url ?? '',
                                      fit: BoxFit.fill,
                                    )),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.find<MainViewController>()
                              .navController
                              .value
                              .jumpToTab(3);
                          Get.find<MainViewController>().navIndex.value = 3;
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 170.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Stack(
                              children: [
                                const Image(
                                  image: AppAssets.ground,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    width: double.infinity,
                                    color: Colors.white.withOpacity(0.65),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          'يمكنك الان تأجير مرافق النادي',
                                          textStyle: TextStyles.text11.copyWith(
                                              fontSize: 14.sp,
                                              height: 1.5.h,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(
                                                  ColorCode.primary)),
                                          maxLines: 5,
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Container(
                                          height: 2.h,
                                          width: 193.w,
                                          decoration: const BoxDecoration(
                                              color: Color(ColorCode.primary)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      InkWell(
                        onTap: () {
                          _launchUrl();
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 170.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: const Color(ColorCode.borderColor),
                                  width: 1.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AppAssets.splashLogo,
                                  width: 1.sw * 0.3),
                              Image(
                                image: AppAssets.splashText,
                                width: 1.sw * 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 33.h,
                      ),
                      if (controller.homeModel.value.data?.questionnaires
                              ?.questions?.isNotEmpty ??
                          false)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(ColorCode.borderColor),
                                  width: 1.r),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                'استبيان ${controller.homeModel.value.data?.questionnaires?.title}',
                                textStyle: TextStyles.text16.copyWith(
                                    color: const Color(ColorCode.primary)),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.w),
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (ctx, i) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            controller
                                                    .homeModel
                                                    .value
                                                    .data
                                                    ?.questionnaires
                                                    ?.questions?[i]
                                                    .question ??
                                                '',
                                            textStyle: TextStyles.text16
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: const Color(
                                                        ColorCode.primary)),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          RatingBar.builder(
                                            glowColor: const Color(0xffC49748)
                                                .withOpacity(0.1),
                                            glowRadius: 1,
                                            initialRating: 0.0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemSize: 35.r,
                                            unratedColor:
                                                const Color(0xffC49748)
                                                    .withOpacity(0.3),
                                            itemCount: 5,
                                            ignoreGestures: false,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            itemBuilder: (context, _) =>
                                                Container(
                                              padding: EdgeInsets.all(1.r),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.star,
                                                  color: Color(0xffC49748),
                                                ),
                                              ),
                                            ),
                                            onRatingUpdate: (v) {
                                              if (controller.questionsAnswers
                                                  .any((element) =>
                                                      element.id ==
                                                      controller
                                                          .homeModel
                                                          .value
                                                          .data
                                                          ?.questionnaires
                                                          ?.questions?[i]
                                                          .id)) {
                                                controller.questionsAnswers
                                                    .removeWhere((element) =>
                                                        element.id ==
                                                        controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.questionnaires
                                                            ?.questions?[i]
                                                            .id);
                                                controller.questionsAnswers.add(
                                                    QuestionsAnswer(
                                                        id: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.questionnaires
                                                            ?.questions?[i]
                                                            .id,
                                                        answers: v));
                                              } else {
                                                controller.questionsAnswers.add(
                                                    QuestionsAnswer(
                                                        id: controller
                                                            .homeModel
                                                            .value
                                                            .data
                                                            ?.questionnaires
                                                            ?.questions?[i]
                                                            .id,
                                                        answers: v));
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                  separatorBuilder: (ctx, i) => SizedBox(
                                        height: 16.h,
                                      ),
                                  itemCount: controller.homeModel.value.data
                                          ?.questionnaires?.questions?.length ??
                                      0),
                              SizedBox(
                                height: 30.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    if (controller.questionsAnswers.isEmpty) {
                                      ToastWidget().showToast(context,
                                          message:
                                              'يجيب الاجابه علي سؤال واحد علي الاقل',
                                          type: ToastTypes.error);
                                    } else {
                                      Get.dialog(
                                        Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                            width: 1.sw * 0.95,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Material(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    CustomText(
                                                      controller
                                                              .homeModel
                                                              .value
                                                              .data
                                                              ?.questionnaires
                                                              ?.title ??
                                                          '',
                                                      textStyle: TextStyles
                                                          .text16
                                                          .copyWith(
                                                              color: const Color(
                                                                  ColorCode
                                                                      .primary),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  20.0.w),
                                                      child: CustomTextFormField(
                                                          hint: 'اكتب ملاحظاتك',
                                                          onSave: (v) {},
                                                          maxLines: 5,
                                                          controller: controller
                                                              .commentController,
                                                          fillColor:
                                                              const Color(
                                                                  0xffE7E7E7),
                                                          inputType:
                                                              TextInputType
                                                                  .text,
                                                      style: const TextStyle(color: Colors.black),),
                                                    ),
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        controller
                                                            .saveQuestions();
                                                      },
                                                      child:
                                                          CustomButtonContainer(
                                                        Center(
                                                            child: Obx(
                                                          () => controller
                                                                      .isQuestionsLoading
                                                                      .value ==
                                                                  true
                                                              ? const SpinKitChasingDots(
                                                                  color: Color(
                                                                      ColorCode
                                                                          .white),
                                                                )
                                                              : CustomText(
                                                                  'حفظ',
                                                                  textStyle: TextStyles.text16.copyWith(
                                                                      color: const Color(
                                                                          ColorCode
                                                                              .white),
                                                                      height: 1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                        )),
                                                        width: 100.w,
                                                        height: 40.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              ColorCode
                                                                  .primary),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: CustomButtonContainer(
                                    Center(
                                        child: Obx(
                                      () =>
                                          controller.isQuestionsLoading.value ==
                                                  true
                                              ? const SpinKitChasingDots(
                                                  color: Color(ColorCode.white),
                                                )
                                              : CustomText(
                                                  'حفظ',
                                                  textStyle: TextStyles.text16
                                                      .copyWith(
                                                          color: const Color(
                                                              ColorCode.white),
                                                          height: 1,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                    )),
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: const Color(ColorCode.primary),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: const [
                      //     Image(
                      //       image: AppAssets.logo4,
                      //       fit: BoxFit.fitWidth,
                      //     ),
                      //     Image(
                      //       image: AppAssets.logo3,
                      //       fit: BoxFit.fitWidth,
                      //     ),
                      //     Image(
                      //       image: AppAssets.logo2,
                      //       fit: BoxFit.fitWidth,
                      //     ),
                      //     Image(
                      //       image: AppAssets.logo1,
                      //       fit: BoxFit.fitWidth,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
          onLoading: const Center(
            child: CircularProgressIndicator(
              color: Color(ColorCode.primary),
            ),
          ),
          onError: (e) => Center(
                child: Text(
                  'حدث خطأ ما',
                  style: TextStyles.text22.copyWith(color: Colors.red),
                ),
              )),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        Uri.parse('https://www.instagram.com/sharjahsports/?hl=en'),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }
  }
}
