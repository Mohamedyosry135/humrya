class AllFacilitiesModel {
  bool? success;
  List<FacilityData>? data;

  AllFacilitiesModel({this.success, this.data});

  AllFacilitiesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <FacilityData>[];
      json['data'].forEach((v) {
        data!.add(FacilityData.fromJson(v));
      });
    }
  }


}

class FacilityData {
  int? id;
  String? name;
  List<Meta>? meta;
  dynamic parentId;
  List<Children>? children;
  List<String>? images;
  String? createdAt;
  String? updatedAt;

  FacilityData(
      {this.id,
        this.name,
        this.meta,
        this.parentId,
        this.children,
        this.images,
        this.createdAt,
        this.updatedAt});

  FacilityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['meta'] != null) {
      meta = <Meta>[];
      json['meta'].forEach((v) {
        meta!.add( Meta.fromJson(v));
      });
    }
    parentId = json['parent_id'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Children {
  int? id;
  String? name;
  List<Meta>? meta;
  String? parentId;
  List? children;
  List<String>? images;
  String? createdAt;
  String? updatedAt;

  Children(
      {this.id,
        this.name,
        this.meta,
        this.parentId,
        this.children,
        this.images,
        this.createdAt,
        this.updatedAt});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['meta'] != null) {
      meta = <Meta>[];
      json['meta'].forEach((v) {
        meta!.add(Meta.fromJson(v));
      });
    }
    parentId = json['parent_id'];
    // if (json['children'] != null) {
    //   children = <Null>[];
    //   json['children'].forEach((v) {
    //     children!.add(new Null.fromJson(v));
    //   });
    // }
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Meta {
  String? variant;

  Meta({this.variant});

  Meta.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant'] = variant;
    return data;
  }
}