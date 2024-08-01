class AllTeamsModel {
  bool? success;
  List<TeamGames>? teamGames;

  AllTeamsModel({this.success, this.teamGames});

  AllTeamsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['team_games'] != null) {
      teamGames = <TeamGames>[];
      json['team_games'].forEach((v) {
        teamGames!.add(TeamGames.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (teamGames != null) {
      data['team_games'] = teamGames!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamGames {
  int? id;
  String? title;
  String? image;

  TeamGames({this.id, this.title});

  TeamGames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}