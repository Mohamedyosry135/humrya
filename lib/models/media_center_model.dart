class MediaCenterModel {
  List<News>? news;
  List<VideosModel>? videos;
  List<MediaCenterPhotos>? photos;

  MediaCenterModel({this.news, this.videos, this.photos});

  MediaCenterModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <VideosModel>[];
      json['videos'].forEach((v) {
        videos!.add( VideosModel.fromJson(v));
      });
    }
    if (json['photos'] != null) {
      photos = <MediaCenterPhotos>[];
      json['photos'].forEach((v) {
        photos!.add(MediaCenterPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
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

class MediaCenterPhotos {
  int? id;
  String? title;
  String? thumbnail;

  MediaCenterPhotos({this.id, this.title, this.thumbnail});

  MediaCenterPhotos.fromJson(Map<String, dynamic> json) {
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