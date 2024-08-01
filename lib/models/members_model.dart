class MembersModel {
  String? name;
  String? image;
  String? position;

  MembersModel({this.image, this.name, this.position});

  MembersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    position = json['position'];
  }
}
