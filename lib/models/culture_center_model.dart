class CultureCenterModel {
  Data? data;

  CultureCenterModel({this.data});

  CultureCenterModel.fromJson(Map<String, dynamic> json) {
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
  News? news;
  List<Centers>? centers;

  Data({this.news, this.centers});

  Data.fromJson(Map<String, dynamic> json) {
    news = json['news'] != null ? News.fromJson(json['news']) : null;
    if (json['centers'] != null) {
      centers = <Centers>[];
      json['centers'].forEach((v) {
        centers!.add(Centers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.toJson();
    }
    if (centers != null) {
      data['centers'] = centers!.map((v) => v.toJson()).toList();
    }
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

class Centers {
  int? id;
  String? title;
  String? body;
  String? thumbnail;
  String? albumName;
  String? hasForm;
  List<String>? album;
  List<CulturePrograms>? programs;
  String? createdAt;
  String? updatedAt;

  Centers(
      {this.id,
        this.title,
        this.body,
        this.thumbnail,
        this.albumName,
        this.hasForm,
        this.programs,
        this.createdAt,
        this.album,
        this.updatedAt});

  Centers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    thumbnail = json['thumbnail'];
    albumName = json['album_name'];
    hasForm = json['has_form'];
    if (json['programs'] != null) {
      programs = <CulturePrograms>[];
      json['programs'].forEach((v) {
        programs!.add(CulturePrograms.fromJson(v));
      });
    }
    if (json['album'] != null) {
      album = <String>[];
      json['album'].forEach((v) {
        album!.add(v);
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['thumbnail'] = thumbnail;
    data['album_name'] = albumName;
    data['has_form'] = hasForm;
    if (programs != null) {
      data['programs'] = programs!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class CulturePrograms {
  String? title;
  String? thumbnail;

  CulturePrograms({this.title, this.thumbnail});

  CulturePrograms.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    return data;
  }
}