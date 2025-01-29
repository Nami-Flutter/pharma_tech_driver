
class NotificationModel {
  List<OneNoti>? data;
  String? message;
  int? code;

  NotificationModel({
    this.data,
    this.message,
    this.code,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? [] : List<OneNoti>.from(json["data"]!.map((x) => OneNoti.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneNoti {
  int? id;
  int? orderId;
  String? title;
  String? type;
  String? body;
  String? createdAt;

  OneNoti({
    this.id,
    this.title,
    this.type,
    this.orderId,
    this.body,
    this.createdAt,
  });

  factory OneNoti.fromJson(Map<String, dynamic> json) => OneNoti(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    orderId: json["order_id"],
    body: json["body"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "order_id": orderId,
    "type": type,
    "created_at": createdAt,
  };
}
