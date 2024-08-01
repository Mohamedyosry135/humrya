class MediaCenterNewsTypeModel {
  List<Data>? data;

  MediaCenterNewsTypeModel({this.data});

  MediaCenterNewsTypeModel.fromJson(Map<String, dynamic> json) {
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
  String? newsableType;
  String? type;
  String? name;
  String? image;
  dynamic id;

  Data({this.newsableType, this.type, this.name, this.image,this.id});

  Data.fromJson(Map<String, dynamic> json) {
    newsableType = json['newsable_type'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    id =  json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newsable_type'] = newsableType;
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}