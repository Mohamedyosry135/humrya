class SingleTeamGameTeamModel {
  Data? data;

  SingleTeamGameTeamModel({this.data});

  SingleTeamGameTeamModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? title;
  League? league;
  List<News>? news;
  List<Players>? players;
  List? coaches;
  List? albums;
  List<VideosModel>? videos;

  Data(
      {this.title,
      this.league,
      this.news,
      this.players,
      this.coaches,
      this.albums,
      this.videos});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(Players.fromJson(v));
      });
    }
    // if (json['coaches'] != null) {
    //   coaches = <Null>[];
    //   json['coaches'].forEach((v) {
    //     coaches!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['albums'] != null) {
    //   albums = <Null>[];
    //   json['albums'].forEach((v) {
    //     albums!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['videos'] != null) {
      videos = <VideosModel>[];
      json['videos'].forEach((v) {
        videos!.add(VideosModel.fromJson(v));
      });
    }
  }
}

class League {
  String? year;
  String? name;
  List<LeagueClubs>? leagueClubs = [
    LeagueClubs(
        rank: 'المركز',
        played: 'لعب',
        won: 'فاز',
        lost: 'خسارة',
        drawn: 'تعادل',
        goalDifference: 'الفرق',
        points: 'النقاط',
        club: Club(title: 'النادي'),
        goals: 'الأهداف')
  ];

  League({this.year, this.name, this.leagueClubs});

  League.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    name = json['name'];
    if (json['leagueClubs'] != null) {
      // leagueClubs = <LeagueClubs>[];
      json['leagueClubs'].forEach((v) {
        leagueClubs!.add( LeagueClubs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['name'] = name;
    if (leagueClubs != null) {
      data['leagueClubs'] = leagueClubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeagueClubs {
  String? leagueId;
  String? rank;
  Club? club;
  String? played;
  String? won;
  String? drawn;
  String? lost;
  String? goals;
  String? goalDifference;
  String? points;

  LeagueClubs(
      {this.leagueId,
      this.rank,
      this.club,
      this.played,
      this.won,
      this.drawn,
      this.lost,
      this.goals,
      this.goalDifference,
      this.points});

  LeagueClubs.fromJson(Map<String, dynamic> json) {
    leagueId = json['league_id'];
    rank = json['rank'];
    club = json['club'] != null ? Club.fromJson(json['club']) : null;
    played = json['played'];
    won = json['won'];
    drawn = json['drawn'];
    lost = json['lost'];
    goals = json['goals'];
    goalDifference = json['goal_difference'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['league_id'] = leagueId;
    data['rank'] = rank;
    if (club != null) {
      data['club'] = club!.toJson();
    }
    data['played'] = played;
    data['won'] = won;
    data['drawn'] = drawn;
    data['lost'] = lost;
    data['goals'] = goals;
    data['goal_difference'] = goalDifference;
    data['points'] = points;
    return data;
  }
}

class Club {
  int? id;
  String? title;
  String? logo;

  Club({this.id, this.title, this.logo});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['logo'] = logo;
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? image;
  String? content;
  String? createdAt;

  News({this.id, this.title, this.image, this.content, this.createdAt});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['content'] = content;
    data['created_at'] = createdAt;
    return data;
  }
}

class Players {
  int? id;
  String? name;
  String? image;
  String? position;
  String? birthDate;
  String? description;
  String? matches;
  String? goals;
  String? redCards;
  String? yellowCards;
  Country? country;

  Players(
      {this.id,
      this.name,
      this.image,
      this.position,
      this.birthDate,
      this.description,
      this.matches,
      this.goals,
      this.redCards,
      this.yellowCards,
      this.country});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    position = json['position'];
    birthDate = json['birth_date'];
    description = json['description'];
    matches = json['matches'];
    goals = json['goals'];
    redCards = json['red_cards'];
    yellowCards = json['yellow_cards'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['position'] = position;
    data['birth_date'] = birthDate;
    data['description'] = description;
    data['matches'] = matches;
    data['goals'] = goals;
    data['red_cards'] = redCards;
    data['yellow_cards'] = yellowCards;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  String? title;
  String? flag;

  Country({this.title, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['flag'] = flag;
    return data;
  }
}

class VideosModel {
  int? id;
  String? title;
  String? url;
  String? thumbnail;

  VideosModel({this.id, this.title, this.url, this.thumbnail});

  VideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
