class TeamPlayersModel {
  List<Data>? data;

  TeamPlayersModel({this.data});

  TeamPlayersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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