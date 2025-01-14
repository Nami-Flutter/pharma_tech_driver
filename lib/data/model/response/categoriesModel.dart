
class CategoriesModel {
  List<Datum>? data;
  String? message;
  int? code;

  CategoriesModel({
    this.data,
    this.message,
    this.code,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class Datum {
  int? id;
  String? image;
  String? title;
  List<Datum>? subCategories;
  DateTime? createdAt;

  Datum({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    subCategories: json["sub_categories"] == null ? [] : List<Datum>.from(json["sub_categories"]!.map((x) => Datum.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
  };
}
