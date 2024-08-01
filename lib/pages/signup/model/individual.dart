
class LoginResponeModel {
  bool? status;
  String? msg;
  Data? data;

  LoginResponeModel({this.status, this.msg, this.data});

  LoginResponeModel.fromJson( json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  Data({this.accessToken, this.tokenType, this.expiresIn, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? code;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? locale;
  String? photoUrl;
  String? role;

  User(
      {this.id,
        this.code,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.locale,
        this.photoUrl,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    locale = json['locale'];
    photoUrl = json['photo_url'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['locale'] = locale;
    data['photo_url'] = photoUrl;
    data['role'] = role;
    return data;
  }
}