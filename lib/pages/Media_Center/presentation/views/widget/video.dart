import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/assets_generated.dart';

class videoWidget extends StatelessWidget {
  List videoCover ;
  int heigtbox;
  int heigtimage;
  int weightimage;


  videoWidget( this.videoCover,this.heigtbox,this.heigtimage,this.weightimage, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigtbox.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) => ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(15.r),
            child: Stack(alignment: Alignment.center,
              children: [
                Image(
                  image: videoCover[i],
                  height: heigtimage.h,
                  width: weightimage.w,
                  fit: BoxFit.fill,
                ),

                const Image(image: AppAssets.videoPlay)
              ],
            ),
          ),
          separatorBuilder: (ctx, i) => SizedBox(
            width: 10.w,
          ),
          itemCount: videoCover.length),
    );

  }
}
