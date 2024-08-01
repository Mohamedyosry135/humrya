class TeamGameModel {
  Data? _data;

  TeamGameModel({Data? data}) {
    if (data != null) {
      _data = data;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;

  TeamGameModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _title;
  String? _image;
  List<News>? _news;
  List<Teams>? _teams;

  Data(
      {int? id,
        String? title,
        String? image,
        List<News>? news,
        List<Teams>? teams}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (image != null) {
      _image = image;
    }
    if (news != null) {
      _news = news;
    }
    if (teams != null) {
      _teams = teams;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get image => _image;
  set image(String? image) => _image = image;
  List<News>? get news => _news;
  set news(List<News>? news) => _news = news;
  List<Teams>? get teams => _teams;
  set teams(List<Teams>? teams) => _teams = teams;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    if (json['news'] != null) {
      _news = <News>[];
      json['news'].forEach((v) {
        _news!.add(News.fromJson(v));
      });
    }
    if (json['teams'] != null) {
      _teams = <Teams>[];
      json['teams'].forEach((v) {
        _teams!.add(Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['image'] = _image;
    if (_news != null) {
      data['news'] = _news!.map((v) => v.toJson()).toList();
    }
    if (_teams != null) {
      data['teams'] = _teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  int? _id;
  String? _title;
  String? _image;
  String? _content;
  String? _createdAt;

  News(
      {int? id,
        String? title,
        String? image,
        String? content,
        String? createdAt}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (image != null) {
      _image = image;
    }
    if (content != null) {
      _content = content;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  News.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _content = json['content'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['image'] = _image;
    data['content'] = _content;
    data['created_at'] = _createdAt;
    return data;
  }
}

class Teams {
  int? _id;
  Null? _name;

  Teams({int? id, Null? name}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Null? get name => _name;
  set name(Null? name) => _name = name;

  Teams.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}




