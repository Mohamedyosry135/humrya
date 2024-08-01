import 'package:example_structure/widgets/custm_network_image_widget.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PhotoGalleryWidget extends StatelessWidget {
  String imageUrl;
  String title;


  PhotoGalleryWidget( this.imageUrl,this.title ,{super.key});
  static final customsmanger=CacheManager(
      Config(
          'images_Key',
          maxNrOfCacheObjects: 20,
          stalePeriod: const Duration(days: 3)
      )
  );
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(15.r),
      child: Stack(
        children: [
          CustomNetworkImageWidget(imageUrl: imageUrl,height: 250.h,width: 1.sw * 0.85,fit: BoxFit.fill,),

          Positioned(
              bottom: 0.h,
              right: 0.w,

              child: Container(
                width: 1.sw,

                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.75),

                  ),
                  child: CustomText(title,textAlign: TextAlign.start,textStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),)))
        ],
      ),
    );
  }
}
