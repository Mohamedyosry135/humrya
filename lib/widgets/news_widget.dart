import 'package:example_structure/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/custom_text.dart';
import 'custm_network_image_widget.dart';

class NewsWidget extends StatelessWidget {
  String imageurl;
  String content;
  String date;
  String title;
  NewsWidget(
      {required this.imageurl,
      required this.content,
      required this.date,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
      decoration: BoxDecoration(
        color: const Color(ColorCode.white).withOpacity(0.55),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomText(
              title,
              textStyle: TextStyles.text13.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(ColorCode.borderColor)),
            ),
            SizedBox(
              height: 16.h,
            ),
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(10.r),
              child: CustomNetworkImageWidget(
                imageUrl: imageurl,
                height: 200.h,
                width: 1.sw * 0.85,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Html(
                  data: content,
                  renderNewlines: true,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    date,
                    textAlign: TextAlign.end,
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.41,
                        color: const Color(ColorCode.primary)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
