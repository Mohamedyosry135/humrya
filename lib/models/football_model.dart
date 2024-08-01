class FootBallModel {
  Data? data;

  FootBallModel({this.data});

  FootBallModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? title;
  String? image;
  List? news;
  List<Teams>? teams;

  Data({this.id, this.title, this.image, this.news, this.teams});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    // if (json['news'] != null) {
    //   news = <Null>[];
    //   json['news'].forEach((v) {
    //     news!.add(Null.fromJson(v));
    //   });
    // }
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  int? id;
 dynamic name;

  Teams({this.id, this.name});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}