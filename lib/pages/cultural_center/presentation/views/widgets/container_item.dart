import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../consts/colors.dart';
class ContainerItem extends StatelessWidget {
Widget child;
ContainerItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 72.5.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(ColorCode.primary),
          borderRadius: BorderRadius.circular(15.r)),
      child: child,
    );
  }
}
