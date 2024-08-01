import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/colors.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  String imageUrl;
  double? height;
  double? width;
  double? zoomHeight;
  double? zoomWidth;
  BoxFit? fit;
  BoxFit? zoomFit;
  void Function()? onTap;
  bool ignoring;

  CustomNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      this.fit,
      this.width,
      this.zoomHeight,
      this.zoomWidth,
      this.zoomFit,
      this.onTap,
      this.ignoring = false,
      this.height});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring,
      child: InkWell(
        onLongPress: () {
          if (onTap != null) {
            Get.dialog(SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Material(
                color: Colors.black.withOpacity(0.6),
                child: Stack(
                  children: [
                    PinchZoom(
                        child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: zoomHeight,
                      width: zoomHeight,
                      fit: zoomFit,
                      key: UniqueKey(),
                      placeholder: (ctx, url) => const SpinKitCubeGrid(
                        color: Color(ColorCode.primary),
                      ),
                    )),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white)),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ))),
                    )
                  ],
                ),
              ),
            ));
          }
        },
        onTap: onTap ??
            () {
              Get.dialog(SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Material(
                  color: Colors.black.withOpacity(0.6),
                  child: Stack(
                    children: [
                      PinchZoom(
                          child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: zoomHeight,
                        width: zoomHeight,
                        fit: zoomFit,
                        key: UniqueKey(),
                        placeholder: (ctx, url) => const SpinKitCubeGrid(
                          color: Color(ColorCode.primary),
                        ),
                      )),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white)),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  ),
                ),
              ));
            },
        child: Image(
          image: NetworkImage(imageUrl),
          height: height,
          width: width,
          fit: fit,
          loadingBuilder: (ctx, child, event) {
            if (event == null) {
              return child;
            } else {
              return SpinKitChasingDots(
                color: const Color(ColorCode.primary),
                size: 30.r,
              );
            }
          },
          errorBuilder: (ctx, object, trace) => const Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
