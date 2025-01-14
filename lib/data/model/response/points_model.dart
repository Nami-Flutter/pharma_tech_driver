class PointsModel {
  Data? data;
  String? message;
  int? code;

  PointsModel({
    this.data,
    this.message,
    this.code,
  });

  factory PointsModel.fromJson(Map<String, dynamic> json) => PointsModel(
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
  int? points;
  List<History>? history;

  Data({
    this.points,
    this.history,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    points: json["points"],
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "points": points,
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class History {
  int? id;
  int? fromUserId;
  FromUser? fromUser;
  int? points;
  String? createdAt;
  DateTime? date;
  String? time;

  History({
    this.id,
    this.fromUserId,
    this.fromUser,
    this.points,
    this.createdAt,
    this.date,
    this.time,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json["id"],
    fromUserId: json["from_user_id"],
    fromUser: json["from_user"] == null ? null : FromUser.fromJson(json["from_user"]),
    points: json["points"],
    createdAt: json["created_at"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from_user_id": fromUserId,
    "from_user": fromUser?.toJson(),
    "points": points,
    "created_at": createdAt,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
  };
}

class FromUser {
  User? user;
  Auth? auth;

  FromUser({
    this.user,
    this.auth,
  });

  factory FromUser.fromJson(Map<String, dynamic> json) => FromUser(
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

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
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
  };
}
