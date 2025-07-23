
class NotificationsCountModel {
  Data? data;
  String? message;
  int? code;

  NotificationsCountModel({
    this.data,
    this.message,
    this.code,
  });

  factory NotificationsCountModel.fromJson(Map<String, dynamic> json) => NotificationsCountModel(
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
  int? countNotifications;

  Data({
    this.countNotifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countNotifications: json["count_notifications"],
  );

  Map<String, dynamic> toJson() => {
    "count_notifications": countNotifications,
  };
}
