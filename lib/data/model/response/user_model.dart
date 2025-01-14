
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Data? data;
  String? message;
  int? code;

  UserModel({
    this.data,
    this.message,
    this.code,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class Data {
  User? user;
  Auth? auth;

  Data({
    this.user,
    this.auth,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "auth": auth?.toJson(),
  };
}

class Auth {
  String? token;

  Auth({
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  String? image;
  int? points;
  String? invitationCode;
  int? cityId;
  City? city;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
    this.cityId,
    this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    invitationCode: json["invitation_code"],
    cityId: json["city_id"],
    city: City.fromJson(json["city"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone_code": phoneCode,
    "phone": phone,
    "image": image,
    "points": points,
    "invitation_code": invitationCode,
    "city_id": cityId,
    "city": city!.toJson(),
  };
}
class City {
  int id;
  String title;
  int deliveryCost;
  int regionId;

  City({
    required this.id,
    required this.title,
    required this.deliveryCost,
    required this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    deliveryCost: json["delivery_cost"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "delivery_cost": deliveryCost,
    "region_id": regionId,
  };
}

