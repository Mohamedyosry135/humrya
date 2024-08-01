import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAssetImageWidget extends StatelessWidget {
  AssetImage image;
  double? height;
  double? width;
  double? zoomHeight;
  double? zoomWidth;
  BoxFit? fit;
  BoxFit? zoomFit;

  CustomAssetImageWidget(
      {super.key,
      required this.image,
      this.fit,
      this.width,
      this.zoomHeight,
      this.zoomWidth,
      this.zoomFit,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Get.dialog(Container(
          height: 1.sh,
          width: 1.sw,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          child: PinchZoom(
              maxScale: 6,
              resetDuration: const Duration(milliseconds: 800),
              child: Image(
                image: image,
                height: zoomHeight,
                width: zoomWidth,
                fit: zoomFit,
              )),
        ));
      },
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
