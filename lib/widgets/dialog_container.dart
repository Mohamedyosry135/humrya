import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';

class DialogContainer extends StatelessWidget {
  AssetImage icon;
  String title;
  String number;
  DialogContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 15.w,
        left: 23.w,
      ),
      width: 237.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.all(10.r),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 15.r,
                color: const Color(
                  ColorCode.shadow,
                ).withOpacity(.09))
          ]),
      child: Row(
        children: [
          Image(
            image: icon,
            height: 17.h,
            width: 17.w,
          ),
          SizedBox(
            width: 11.w,
          ),
          Text(
            title,
            style: TextStyles.text16.copyWith(
                color: const Color(ColorCode.black),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text(
            number,
            style: TextStyles.text16.copyWith(
                color: const Color(ColorCode.primary),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
