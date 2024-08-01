// import 'package:example_structure/pages/rental_hotel/presentation/views/rental_hotel_view.dart';
// import 'package:example_structure/resources/assets_generated.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../../../consts/colors.dart';
// import '../../../../consts/text_styles.dart';
// import '../../../../resources/assets_svg_generated.dart';
// import '../../../../widgets/custom_text.dart';
// import '../../../../widgets/home_appbar.dart';
// import '../controllers/rental_hotel_controller.dart';
//
// class PreRentHotel extends GetView<RentalHotelController> {
//   const PreRentHotel({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: HomeAppBar(
//         height: 120.h,
//         child: Padding(
//           padding: EdgeInsets.only(
//               bottom: 30.0.h, left: 30.w, right: 30.w, top: 66.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Opacity(
//                 opacity: 0,
//                 child: SvgPicture.asset(AppSVGAssets.back),
//               ),
//               CustomText(
//                 'الفندق',
//                 textAlign: TextAlign.center,
//                 textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
//               ),
//               InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: SvgPicture.asset(AppSVGAssets.back)),
//             ],
//           ),
//         ),
//       ),
//       body: controller.obx(
//           (snap) => ListView.separated(
//             physics: const BouncingScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//               itemBuilder: (ctx, i) => InkWell(onTap: (){
//                 controller.selectedFeature =  controller.facility.value.children?[i].id;
//                 // Get.to(() => RentalHotelView(isHotel: true,));
//               },
//                 child: Container(
//                       height: 200.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Stack(
//                 children: [
//                   Image(
//                     height: 200.h,
//                     width: double.infinity,
//                     image: NetworkImage(
//                         controller.facility.value.images!.first),
//                     errorBuilder: (context, object, stackTrace) => Image(
//                       height: 200.h,
//                       width: double.infinity,
//                       image: AppAssets.backgroundImage,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Center(
//                       child: CustomText(
//                     controller.facility.value.meta?[i].variant ?? '',
//                     textStyle:
//                         TextStyles.text16.copyWith(color: Colors.white),
//                   ))
//                 ],
//                       ),
//                     ),
//               ),
//               separatorBuilder: (ctx, i) =>  SizedBox(height: 16.h,),
//               itemCount: controller.facility.value.meta?.length ?? 0),
//           onLoading: const Center(
//             child: SpinKitCircle(
//               color: Color(ColorCode.primary),
//             ),
//           )),
//     );
//   }
// }
