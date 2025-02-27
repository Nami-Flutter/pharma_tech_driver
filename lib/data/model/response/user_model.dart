
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
  Delegate? delegate;
  Auth? auth;

  Data({
    this.delegate,
    this.auth,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    delegate: json["delegate"] == null ? null : Delegate.fromJson(json["delegate"]),
    auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
  );

  Map<String, dynamic> toJson() => {
    "delegate": delegate?.toJson(),
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

class Delegate {
  int? id;
  int? adminId;
  String? name;
  String? image;
  String? phone;

  Delegate({
    this.id,
    this.adminId,
    this.name,
    this.image,
    this.phone,
  });

  factory Delegate.fromJson(Map<String, dynamic> json) => Delegate(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "image": image,
    "phone": phone,
  };
}
