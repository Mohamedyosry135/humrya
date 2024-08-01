import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mediagaleryWidget extends StatelessWidget {
  double heigtimage;
  double weightimage;
  List albumsPhotos;

  mediagaleryWidget(this.albumsPhotos, this.heigtimage, this.weightimage,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 20,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ]),
      child: GridView.builder(
        primary: true,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: (40 / 40)),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: albumsPhotos[index],
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        },
        itemCount: 8,
      ),
    );
  }
}
