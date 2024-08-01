import 'package:example_structure/models/teamplayer_model.dart';
import 'package:example_structure/widgets/player_item.dart';
import 'package:flutter/material.dart';



class PlayersItemWidget extends StatelessWidget {
  List<Players> players;

  PlayersItemWidget( this.players, {super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: Row(children: players.map((e) => Padding(
        padding: const EdgeInsetsDirectional.only(start: 8),
        child: Playersitem(
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
        ),
      )).toList(),),
    );
  }
}
