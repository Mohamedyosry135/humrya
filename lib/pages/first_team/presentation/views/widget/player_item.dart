// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../consts/colors.dart';
// import '../../../../../consts/text_styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../widgets/custom_text.dart';
//
// class PlayerItem extends StatelessWidget {
//   String photo;
//   String name;
//   String position;
//   String flag;
//   PlayerItem(
//       {super.key,
//       required this.name,
//       required this.flag,
//       required this.photo,
//       required this.position});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color(ColorCode.borderColor),
//             width: 1,
//           ),
//           borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15))),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: Stack(
//         children: [
//           CachedNetworkImage(
//             imageUrl: photo,
//             key: UniqueKey(),
//             height: 107.h,
//             width: 77.22.w,
//             placeholder: (ctx, url) => const Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//           Positioned(
//             bottom: 0.0,
//             child: Container(
//               height: 24.5.h,
//               width: 77.22.w,
//               padding: EdgeInsets.symmetric(horizontal: 4.w),
//               decoration: BoxDecoration(
//                   color: const Color(ColorCode.white),
//                   borderRadius:
//                       BorderRadius.only(topLeft: Radius.circular(15.r))),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     name,
//                     textAlign: TextAlign.start,
//                     maxLines: 1,
//                     textStyle: TextStyles.text11.copyWith(
//                         fontSize: 6.sp,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(ColorCode.borderColor)),
//                   ),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   Row(
//                     children: [
//                       CustomText(
//                         position,
//                         textStyle: TextStyles.text11.copyWith(
//                             fontSize: 6.sp,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(ColorCode.primary)),
//                       ),
//                       SizedBox(
//                         width: 6.w,
//                       ),
//                       ClipRRect(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         child: SizedBox(
//                           height: 10.h,
//                           width: 10.w,
//                           child: Image(
//                             image: NetworkImage(flag),
//                             loadingBuilder: (context, child, loadingProgress) {
//                               if (loadingProgress == null) {
//                                 return child;
//                               }
//                               return const Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 12),
//                                 child: CircularProgressIndicator(
//                                     color: Color(ColorCode.primary)),
//                               );
//                             },
//                             errorBuilder: (context, object, stackTracer) {
//                               return const Icon(
//                                 Icons.error_outline,
//                                 color: Colors.red,
//                               );
//                             },
//                             width: 0.9.sw,
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
