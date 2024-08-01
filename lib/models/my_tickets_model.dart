class MyTicketsModel {
  String? status;
  List<TicketData>? data;

  MyTicketsModel({this.status, this.data});

  MyTicketsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TicketData>[];
      json['data'].forEach((v) {
        data!.add(TicketData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketData {
  Club? club;
  Matche? matche;
  dynamic gate;
  dynamic level;
  dynamic code;
  String? date;
  String? adult;
  dynamic childerns;
  String? image;
  dynamic qrCode;

  TicketData(
      {this.club,
        this.matche,
        this.gate,
        this.level,
        this.code,
        this.date,
        this.adult,
        this.childerns,
        this.image,
        this.qrCode});

  TicketData.fromJson(Map<String, dynamic> json) {
    club = json['club'] != null ? Club.fromJson(json['club']) : null;
    matche =
    json['matche'] != null ? Matche.fromJson(json['matche']) : null;
    gate = json['gate'];
    level = json['level'];
    code = json['code'];
    date = json['date'];
    adult = json['adult'];
    childerns = json['childerns'];
    image = json['image'];
    qrCode = json['qr_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (club != null) {
      data['club'] = club!.toJson();
    }
    if (matche != null) {
      data['matche'] = matche!.toJson();
    }
    data['gate'] = gate;
    data['level'] = level;
    data['code'] = code;
    data['date'] = date;
    data['adult'] = adult;
    data['childerns'] = childerns;
    data['image'] = image;
    data['qr_code'] = qrCode;
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

class Matche {
  int? id;
  String? stadioum;
  String? gameTitle;
  String? gameLogo;
  String? date;
  String? time;
  Club? host;
  Club? guest;
  int? remainingTime;

  Matche(
      {this.id,
        this.stadioum,
        this.gameTitle,
        this.gameLogo,
        this.date,
        this.time,
        this.host,
        this.guest,
        this.remainingTime});

  Matche.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stadioum = json['stadioum'];
    gameTitle = json['game_title'];
    gameLogo = json['game_logo'];
    date = json['date'];
    time = json['time'];
    host = json['host'] != null ? Club.fromJson(json['host']) : null;
    guest = json['guest'] != null ? Club.fromJson(json['guest']) : null;
    remainingTime = json['remaining_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stadioum'] = stadioum;
    data['game_title'] = gameTitle;
    data['game_logo'] = gameLogo;
    data['date'] = date;
    data['time'] = time;
    if (host != null) {
      data['host'] = host!.toJson();
    }
    if (guest != null) {
      data['guest'] = guest!.toJson();
    }
    data['remaining_time'] = remainingTime;
    return data;
  }
}