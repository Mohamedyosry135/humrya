class HomeModel {
  Data? data;

  HomeModel({this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  Advertisement? advertisement2;
  Advertisement? advertisement3;
  List<News>? news;
  List<UpcomingMatches>? upcomingMatches;
  List<Achievements>? achievements;
  List<Gallery>? gallery;
  List<Advertisement>? logos;
  Questionnaires? questionnaires;

  Data(
      {this.advertisement2,
      this.advertisement3,
      this.news,
      this.upcomingMatches,
      this.achievements,
      this.gallery,
      this.logos,
      this.questionnaires});

  Data.fromJson(Map<String, dynamic> json) {
    advertisement2 = json['advertisement_2'] != null
        ? Advertisement.fromJson(json['advertisement_2'])
        : null;
    advertisement3 = json['advertisement_3'] != null
        ? Advertisement.fromJson(json['advertisement_3'])
        : null;
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    if (json['upcoming_matches'] != null) {
      upcomingMatches = <UpcomingMatches>[];
      json['upcoming_matches'].forEach((v) {
        upcomingMatches!.add(UpcomingMatches.fromJson(v));
      });
    }
    if (json['achievements'] != null) {
      achievements = <Achievements>[];
      json['achievements'].forEach((v) {
        achievements!.add(Achievements.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    questionnaires = json['questionnaires'] != null
        ? Questionnaires.fromJson(json['questionnaires'])
        : null;
    if (json['logos'] != null) {
      logos = <Advertisement>[];
      json['logos'].forEach((v) {
        logos!.add(Advertisement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (advertisement2 != null) {
      data['advertisement_2'] = advertisement2!.toJson();
    }
    if (advertisement3 != null) {
      data['advertisement_3'] = advertisement3!.toJson();
    }
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (upcomingMatches != null) {
      data['upcoming_matches'] =
          upcomingMatches!.map((v) => v.toJson()).toList();
    }
    if (achievements != null) {
      data['achievements'] = achievements!.map((v) => v.toJson()).toList();
    }
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    if (logos != null) {
      data['logos'] = logos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Advertisement {
  String? key;
  String? title;
  String? image;

  Advertisement({this.key, this.title, this.image});

  Advertisement.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['title'] = title;
    data['image'] = image;
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

class UpcomingMatches {
  int? id;
  String? stadioum;
  String? gameTitle;
  String? gameLogo;
  String? date;
  String? time;
  Host? host;
  Host? guest;
  int? remainingTime;

  UpcomingMatches(
      {this.id,
      this.stadioum,
      this.gameTitle,
      this.gameLogo,
      this.date,
      this.time,
      this.host,
      this.guest,
      this.remainingTime});

  UpcomingMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stadioum = json['stadioum'];
    gameTitle = json['game_title'];
    gameLogo = json['game_logo'];
    date = json['date'];
    time = json['time'];
    host = json['host'] != null ? Host.fromJson(json['host']) : null;
    guest = json['guest'] != null ? Host.fromJson(json['guest']) : null;
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

class Host {
  int? id;
  String? title;
  String? logo;

  Host({this.id, this.title, this.logo});

  Host.fromJson(Map<String, dynamic> json) {
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

class Achievements {
  int? id;
  String? title;
  String? image;
  String? content;

  Achievements({this.id, this.title, this.image, this.content});

  Achievements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['content'] = content;
    return data;
  }
}

class Gallery {
  int? id;
  String? title;
  String? url;

  Gallery({this.id, this.title, this.url});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}

class Questionnaires {
  int? id;
  String? title;
  String? commentTitle;
  List<Questions>? questions;

  Questionnaires({this.id, this.title, this.commentTitle, this.questions});

  Questionnaires.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    commentTitle = json['comment_title'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['comment_title'] = commentTitle;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? question;
  dynamic answers;

  Questions({this.id, this.question, this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answers = json['answers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers;
    return data;
  }
}

class QuestionsAnswer {
  int? id;

  double? answers;

  QuestionsAnswer({this.id, this.answers});

  QuestionsAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    answers = json['answers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = id;

    data['answer'] = answers;
    return data;
  }
}
