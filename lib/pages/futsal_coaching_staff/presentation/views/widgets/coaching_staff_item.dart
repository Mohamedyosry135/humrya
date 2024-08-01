import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';

class CoachingStaffitem extends StatelessWidget {
  double? height;
  double? width;
  String? flag;
  String? image;
  String? name;
  String? position;

  CoachingStaffitem(
      {super.key,
      this.width,
      this.height,
      this.flag,
      this.position,
      this.name,
      this.image});
  static final customsmanger = CacheManager(Config('images_Key',
      maxNrOfCacheObjects: 20, stalePeriod: const Duration(days: 3)));

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.fill,
          key: UniqueKey(),
          cacheManager: customsmanger,
          imageUrl: image?? '',
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            strokeWidth: 4,
            color: Color(ColorCode.primary),
          )),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      Positioned(
        bottom: 6.w,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r)),
              gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
                colors: [
                  const Color(ColorCode.white).withOpacity(0.0),
                  const Color(ColorCode.white),
                  const Color(ColorCode.white).withOpacity(.3),
                ],
              )),
          width: width,
          height: 34.42.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$name\n$position',
                style: TextStyles.text11.copyWith(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(ColorCode.primary),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: CachedNetworkImage(
                  height: 8.64.h,
                  width: 18.6.w,
                  fit: BoxFit.fill,
                  key: UniqueKey(),
                  cacheManager: customsmanger,
                  imageUrl: flag!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
