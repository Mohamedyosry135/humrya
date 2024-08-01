import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoWidget extends StatefulWidget {
  String imageUrl;
  String videoId;
  String? title;
  CustomVideoWidget(
      {super.key, required this.imageUrl, required this.videoId, this.title});

  @override
  State<CustomVideoWidget> createState() => _CustomVideoWidgetState();
}

class _CustomVideoWidgetState extends State<CustomVideoWidget> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.videoId != 'none') {
          Get.dialog(Material(
            child: Stack(
              children: [
                SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                          topActions: <Widget>[
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                _controller.metadata.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () {},
                            ),
                          ],
                          onReady: () {
                            _isPlayerReady = true;
                          },
                        ),
                        builder: (ctx, player) => player)),
                Positioned(
                  top: 60.h,
                  left: 10.w,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.6)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close)),
                    ),
                  ),
                )
              ],
            ),
          ));
        } else {
          ToastWidget().showToast(context,
              message: 'لايمكن تشغيل هذا الفيديو', type: ToastTypes.info);
        }
      },
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  height: 98.h,
                  width: 153.w,
                  fit: BoxFit.fill,
                  key: UniqueKey(),
                ),
                Positioned(
                    top: 34.h,
                    right: 61.w,
                    child: const Image(image: AppAssets.videoPlay)),
              ],
            ),
          ),
          Container(
            width: 153.w,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r))),
            child: CustomText(
              widget.title ?? '',
              textAlign: TextAlign.start,
              maxLines: 2,
              textStyle: const TextStyle(
                  color: Color(
                    ColorCode.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
