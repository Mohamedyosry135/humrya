import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../resources/assets_generated.dart';
import '../../../../../widgets/custom_text.dart';

class ClubsWidget extends StatelessWidget {
  String title;
  ClubsWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: 315.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(colors: [
            const Color(ColorCode.primary),
            const Color(ColorCode.primary).withOpacity(0.86),
            const Color(ColorCode.primary),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              title,
              textStyle: TextStyles.text22.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(ColorCode.white)),
            ),
          ),
          const Image(image: AppAssets.twoPlayesFaded)
        ],
      ),
    );
  }
}
