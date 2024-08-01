class TeamPlayerGameModel {
  Data? data;

  TeamPlayerGameModel({this.data});

  TeamPlayerGameModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  League? league;
  List<News>? news;
  List<Players>? players;
  List<Coaches>? coaches;
  List<Albums>? albums;

  Data(
      {this.title,
        this.league,
        this.news,
        this.players,
        this.coaches,
        this.albums,
        });

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    league =
    json['league'] != null ? League.fromJson(json['league']) : null;
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
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(Coaches.fromJson(v));
      });
    }
    if (json['albums'] != null) {
      albums = <Albums>[];
      json['albums'].forEach((v) {
        albums!.add(Albums.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    if (coaches != null) {
      data['coaches'] = coaches!.map((v) => v.toJson()).toList();
    }
    if (albums != null) {
      data['albums'] = albums!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class League {
  String? year;
  String? name;
  List<Null>? leagueClubs;

  League({this.year, this.name, this.leagueClubs});

  League.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    name = json['name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['name'] = name;

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

class Coaches {
  String? name;
  String? image;
  String? position;
  String? team;
  Country? country;

  Coaches({this.name, this.image, this.position, this.team, this.country});

  Coaches.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    position = json['position'];
    team = json['team'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['position'] = position;
    data['team'] = team;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Albums {
  int? id;
  String? title;
  String? thumbnail;

  Albums({this.id, this.title, this.thumbnail});

  Albums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    return data;
  }
}