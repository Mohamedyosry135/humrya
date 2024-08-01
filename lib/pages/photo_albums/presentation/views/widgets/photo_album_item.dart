
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';

class PhotoalbumWidget extends StatelessWidget {
 final String title;
 final String imageUrl;


  const PhotoalbumWidget(
      {super.key, required this.title, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(15.r),
      child: Stack(alignment: AlignmentDirectional.center, children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 250.h,
          fit: BoxFit.fill,
          key: UniqueKey(),
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
        ),
        Container(
          width: double.infinity,
          height: 250.h,
          color: Colors.black87.withOpacity(0.5),
        ),
        Text(
          title,
          style: TextStyles.text22.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: const Color(ColorCode.gold),
          ),
        ),
      ]),
    );
  }
}
