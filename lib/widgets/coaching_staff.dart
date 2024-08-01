import 'package:example_structure/models/teamplayer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/futsal_coaching_staff/presentation/views/widgets/coaching_staff_item.dart';



class CoatchingStaffItemWidget extends StatelessWidget {

  List<Coaches>coash;

  CoatchingStaffItemWidget(this.coash, {super.key} );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 20,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ]),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, i) => CoachingStaffitem(
            flag: coash[i].country?.flag,
            name:coash[i].name,
            image:coash[i].image,
            position:coash[i].position,


          ),
          separatorBuilder: (ctx, i) => SizedBox(
            width: 12.w,
          ),
          itemCount: coash.length),
    );

  }
}
