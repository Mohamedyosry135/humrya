class GameModel {
  int? id;
  String? title;
  String? image;

  GameModel({
    this.title,
    this.id,
    this.image
  });

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}
