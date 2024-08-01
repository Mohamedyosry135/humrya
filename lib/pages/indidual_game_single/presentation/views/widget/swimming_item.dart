
import 'package:example_structure/pages/indidual_game_single/presentation/views/widget/swimming_news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class swimmingItemWidget extends StatelessWidget {
  const swimmingItemWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 365.h,
      width: 315.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 20,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ]),
      child:  const SwimmingNewsPlayWidget(),
    );
  }
}
