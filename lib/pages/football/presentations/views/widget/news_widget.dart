// import 'package:example_structure/consts/text_styles.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../consts/colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../resources/assets_generated.dart';
// import '../../../../../widgets/custom_text.dart';
// class NewsWidget extends StatelessWidget {
//   const NewsWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 315.w,
//       height: 139.h,
//       padding:
//       EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
//       decoration: BoxDecoration(
//           color: Color(ColorCode.white).withOpacity(0.55),
//           borderRadius: BorderRadius.circular(10.r),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Color(0xff000000).withOpacity(0.08),
//           //     spreadRadius: 0,
//           //     blurRadius: 20,
//           //     offset: Offset(0, 0), // changes position of shadow
//           //   ),
//           // ]
//       ),
//       child: Column(
//         children: [
//           CustomText(
//             'نادي الحمرية يحصل على جائزة أفضل نادي ثقافي',
//             textStyle: TextStyles.text13.copyWith(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Color(ColorCode.borderColor)),
//           ),
//           SizedBox(
//             height: 16.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ClipRRect(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: Image(
//                   image: AppAssets.newsImage,
//                   height: 86.h,
//                   width: 86.w,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               SizedBox(
//                 width: 16.w,
//               ),
//               Expanded(
//                   child: Column(
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                             text:
//                             'حصل نادي الحمرية من لجنة التراخيص الابتدائية باتحاد كرة القدم، (حصل) على الترخيص لدوري الدرجة الأولى للموسم الرياضي  2023/2022......',
//                             style: TextStyles.text11.copyWith(
//                                 color: Color(0xff646464),
//                                 fontSize: 9.sp,
//                                 height: 1.8.h,
//                                 fontWeight: FontWeight.w700),
//                             children: [
//                               TextSpan(
//                                   text: 'المزيد',
//                                   style: TextStyles.text11.copyWith(
//                                       fontSize: 10.sp,
//                                       fontWeight: FontWeight.w700,
//                                       height: 1.5.h,
//                                       color:
//                                       Color(ColorCode.borderColor)))
//                             ]),
//                       ),
//                       SizedBox(
//                         height: 8.h,
//                       ),
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CustomText(
//                           '12 ديسمبر 2022',
//                           textAlign: TextAlign.end,
//                           textStyle: TextStyles.text11.copyWith(
//                               fontSize: 7.sp,
//                               fontWeight: FontWeight.w400,
//                               letterSpacing: 0.41,
//                               color: Color(ColorCode.primary)),
//                         ),
//                       )
//                     ],
//                   ))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
