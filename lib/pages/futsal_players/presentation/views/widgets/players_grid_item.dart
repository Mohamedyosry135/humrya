import 'package:example_structure/models/teamplayer_model.dart';
import 'package:example_structure/widgets/player_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PlayersGrid extends StatelessWidget {

  List<Players>? players;
  PlayersGrid({super.key,
   this.players
  }
      );
  @override

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 22.w),
        child: GridView.count(

            physics: const BouncingScrollPhysics(),
            childAspectRatio: .7,
            crossAxisCount: 3,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 16.h,
            children: players!.map((e) => Playersitem(

              image: e.image ?? "",
              name: e.name ?? "",
              title: e.position ?? "",
              flag: e.country?.flag ?? "",
              date: e.birthDate ?? "",
              describtion:e.description ?? "",
              nationality:e.country?.title ?? "",
              goal:e.goals ?? "",
              matching: e.matches ?? "",
              redcard: e.redCards?? "",
              yellowcard:e.yellowCards ?? "",
            )





            ).toList()
        ));
  }
}
