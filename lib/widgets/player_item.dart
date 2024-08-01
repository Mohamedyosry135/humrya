import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../widgets/custom_text.dart';

class Playersitem extends StatelessWidget {
  String image;
  String name;
  String title;
  String flag;
  String? date;
  String? describtion;
  String? nationality;
  String? goal;
  String? matching;
  String? redcard;
  String? yellowcard;
  void Function()? onTap;
  double? boxHeight;
  double? boxWidth;

  Playersitem({
    super.key,
    required this.title,
    required this.image,
    required this.name,
    required this.flag,
    this.date,
    this.describtion,
    this.nationality,
    this.goal,
    this.matching,
    this.redcard,
    this.onTap,
    this.boxWidth,
    this.boxHeight,
    this.yellowcard,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      width: boxWidth,
      child: Stack(children: [
        Container(

          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0.r),
                topRight: Radius.circular(15.0.r),
              ),
              border: Border.all(
                  width: 1, color: const Color(ColorCode.borderColor))),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0.r),
                topRight: Radius.circular(15.0.r),
              ),
              child: CustomNetworkImageWidget(
                imageUrl: image,
                fit: BoxFit.fill,
                onTap: onTap,
                height: boxHeight,width: boxWidth,
              )),
        ),
        Positioned(
          bottom: 0.w,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r)),
                gradient: LinearGradient(colors: [
                  const Color(ColorCode.white),
                  const Color(ColorCode.white).withOpacity(0.9),
                  const Color(ColorCode.white).withOpacity(0.7)
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
            padding: const EdgeInsetsDirectional.only(
                end: 3, top: 6, bottom: 6, start: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  name,
                  maxLines: 1,
                  textStyle: TextStyles.text11.copyWith(
                    fontSize: 13.sp,
                    overflow: TextOverflow.ellipsis,
                    height: 1.5.h,
                    fontWeight: FontWeight.w700,
                    color: const Color(ColorCode.gold),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                      title,
                      textStyle: TextStyles.text11.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.primary),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CachedNetworkImage(
                      imageUrl: flag,
                      height: 8.64.h,
                      width: 18.6.w,
                      fit: BoxFit.fill,
                      key: UniqueKey(),
                      placeholder: (ctx, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
