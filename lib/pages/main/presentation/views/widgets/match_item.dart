import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../resources/assets_generated.dart';
import '../../../../../widgets/custom_text.dart';

class MatchItem extends StatelessWidget {
  String? date;
  String? time;
  String? host;
  String? guest;
  String? hostLogo;
  String? guestLogo;
  String? gameTitle;
  String title;
  MatchItem(
      {super.key,
      required this.date,
      required this.guest,
      required this.guestLogo,
      required this.host,
      required this.hostLogo,
      required this.time,
      required this.gameTitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      width: 135.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 135.h,
              width: 135.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(color: const Color(ColorCode.borderColor))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    gameTitle ?? '',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.navBarInactive)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: hostLogo ?? '',
                            height: 30.h,
                            width: 30.w,
                            key: UniqueKey(),
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          CustomText(
                            host!,
                            textStyle: TextStyles.text11.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: guestLogo ?? '',
                            height: 30.h,
                            width: 30.w,
                            key: UniqueKey(),
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          CustomText(
                            guest!,
                            textStyle: TextStyles.text11.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11.5.h,
                  ),
                  CustomText(
                    date ?? '',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.navBarInactive)),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  CustomText(
                    time ?? '',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.navBarInactive)),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 6.h,
              right: 40.w,
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.white),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AppAssets.ball),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      title,
                      textStyle: TextStyles.text11.copyWith(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff2B2B2B)),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
