import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors.dart';
import '../consts/text_styles.dart';
import '../resources/assets_generated.dart';
import 'custom_text.dart';

class NextMatchItem extends StatelessWidget {
  String hostName;
  String guestName;
  String stadium;
  String date;
  String time;
  String hostLogo;
  String guestLogo;
  String title;
  NextMatchItem(
      {super.key, required this.guestLogo,
      required this.hostLogo,
      required this.time,
      required this.date,
      required this.guestName,
      required this.hostName,
      required this.stadium,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127.h,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 114.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 63.h,
                      padding:
                          EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.white),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(ColorCode.lightGray)
                                  .withOpacity(0.12),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Image(image: AppAssets.stadiumSmall),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            stadium,
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          CustomText(
                            ' $date\n $time',
                            textAlign: TextAlign.start,
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          const Image(image: AppAssets.calender)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 63.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(ColorCode.lightGray)
                                  .withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, -2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            hostName,
                            textStyle:
                                TextStyles.text16.copyWith(fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            'vs',
                            textStyle: TextStyles.text16.copyWith(
                                fontSize: 7.sp,
                                color: const Color(ColorCode.black)),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            guestName,
                            textStyle:
                                TextStyles.text16.copyWith(fontSize: 15.sp),
                          ),
                          const Spacer(),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0.h, horizontal: 4.w),
                              child: CachedNetworkImage(
                                imageUrl: hostLogo,
                                fit: BoxFit.cover,
                                key: UniqueKey(),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0.h, horizontal: 4.w),
                              child: CachedNetworkImage(
                                imageUrl: guestLogo,
                                fit: BoxFit.cover,
                                key: UniqueKey(),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 16.w,
            child: Container(
              height: 26.h,
              width: 65.w,
              decoration: BoxDecoration(
                  color: const Color(ColorCode.white),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: CustomText(
                 title,
                  textStyle: TextStyles.text11.copyWith(
                      color: const Color(ColorCode.primary),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
