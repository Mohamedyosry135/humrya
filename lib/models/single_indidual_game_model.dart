class SingleIndividualGameModel {
  Data? data;

  SingleIndividualGameModel({this.data});

  SingleIndividualGameModel.fromJson(Map<String, dynamic> json) {
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
  String? content;
  List<Photos>? photos;
  List<News>? news;

  Data({this.id, this.title, this.image, this.content, this.photos, this.news});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['content'] = content;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int? id;
  String? title;
  String? url;

  Photos({this.id, this.title, this.url});

  Photos.fromJson(Map<String, dynamic> json) {
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