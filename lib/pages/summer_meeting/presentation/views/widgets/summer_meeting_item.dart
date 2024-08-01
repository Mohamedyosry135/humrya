import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';

class SummerMeetingItem extends StatelessWidget {
  String title;
  SummerMeetingItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.5.h,
      width: 90.5.w,
      decoration: BoxDecoration(
          color: const Color(ColorCode.primary),
          borderRadius: BorderRadius.circular(15.r),
          image: const DecorationImage(
              image: AppAssets.backgroundImage, fit: BoxFit.fill)),
      child: Center(
          child: CustomText(
        title,
        maxLines: 4,
        textStyle: TextStyles.text13.copyWith(
            fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}
