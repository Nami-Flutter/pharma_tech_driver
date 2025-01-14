class MedicalClinicModel {
  List<ChatMessage>? data;
  String? message;
  int? code;

  MedicalClinicModel({
    this.data,
    this.message,
    this.code,
  });

  factory MedicalClinicModel.fromJson(Map<String, dynamic> json) => MedicalClinicModel(
    data: json["data"] == null ? [] : List<ChatMessage>.from(json["data"]!.map((x) => ChatMessage.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class ChatMessage {
  int? userId;
  String? sender;
  String? msgType;
  String? date;
  String? hijri_date;
  String? time;
  String? message;
  String? file;
  String? ext;
  String? type;
  String? name;
  String? size;
  String? base64;

  ChatMessage({
    this.userId,
    this.sender,
    this.msgType,
    this.date,
    this.hijri_date,
    this.time,
    this.message,
    this.file,
    this.ext,
    this.type,
    this.name,
    this.size,
    this.base64,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    userId: json["user_id"],
    sender: json["sender"],
    msgType: json["msg_type"],
    date: json["date"],
    hijri_date: json["hijri_date"],
    time: json["time"],
    message: json["message"],
    file: json["file"],
    ext: json["ext"],
    type: json["type"],
    name: json["name"],
    size: json["size"],
    base64: json["base64"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "sender": sender,
    "msg_type": msgType,
    "date": date,
    "hijri_date": hijri_date,
    "time": time,
    "message": message,
    "file": file,
    "ext": ext,
    "type": type,
    "name": name,
    "size": size,
    "base64": base64,
  };
}


