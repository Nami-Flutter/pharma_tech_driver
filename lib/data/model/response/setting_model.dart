class SettingModel {
  Data? data;
  String? message;
  int? code;

  SettingModel({
    this.data,
    this.message,
    this.code,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
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
  String? aboutUs;

  Data({
    this.aboutUs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    aboutUs: json["about_us"],
  );

  Map<String, dynamic> toJson() => {
    "about_us": aboutUs,
  };
}
