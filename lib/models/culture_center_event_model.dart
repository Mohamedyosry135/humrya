class CultureCenterEventModel {
  int? id;
  String? title;
  String? body;
  String? date;
  String? centerId;
  String? createdAt;
  String? updatedAt;
  Center? center;

  CultureCenterEventModel(
      {this.id,
        this.title,
        this.body,
        this.date,
        this.centerId,
        this.createdAt,
        this.updatedAt,
        this.center});

  CultureCenterEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
    centerId = json['center_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    center =
    json['center'] != null ? Center.fromJson(json['center']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['date'] = date;
    data['center_id'] = centerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (center != null) {
      data['center'] = center!.toJson();
    }
    return data;
  }
}

class Center {
  int? id;
  String? title;
  String? body;
  String? hasForm;
  String? createdAt;
  String? updatedAt;
  String? albumName;

  Center(
      {this.id,
        this.title,
        this.body,
        this.hasForm,
        this.createdAt,
        this.updatedAt,
        this.albumName});

  Center.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    hasForm = json['has_form'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    albumName = json['album_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['has_form'] = hasForm;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['album_name'] = albumName;
    return data;
  }
}