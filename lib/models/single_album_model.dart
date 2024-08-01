class SingleAlbumModel {
  Photos? photos;

  SingleAlbumModel({this.photos});

  SingleAlbumModel.fromJson(Map<String, dynamic> json) {
    photos = json['photos'] != null ? Photos.fromJson(json['photos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.toJson();
    }
    return data;
  }
}

class Photos {
  int? id;
  String? title;
  String? thumbnail;
  List? photo;
  String? albumType;

  Photos({this.id, this.title, this.thumbnail,  this.photo, this.albumType});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    if (json['photos'] != null) {
      photo = [];
      photo = json['photos'];
    }

    albumType = json['album_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['photos'] = photo;
    data['album_type'] = albumType;
    return data;
  }
}
