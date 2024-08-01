import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ImageItem extends StatelessWidget {
AssetImage image;
ImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(15.r),
      child: Image(image: image,height: 140.h,width: 211.w,),
    );
  }
}
