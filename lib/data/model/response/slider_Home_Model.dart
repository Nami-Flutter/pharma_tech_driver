
class HomeSliderModel {
  Data? data;
  String? message;
  int? code;

  HomeSliderModel({
    this.data,
    this.message,
    this.code,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) => HomeSliderModel(
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
  List<Slider>? slider;
  int? notificationCount;

  Data({
    this.slider,
    this.notificationCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      slider: json["slider"] == null ? [] : List<Slider>.from(json["slider"]!.map((x) => Slider.fromJson(x))),
  notificationCount: json["notification_count"],
  );

  Map<String, dynamic> toJson() => {
  "slider": slider == null ? [] : List<dynamic>.from(slider!.map((x) => x.toJson())),
  "notification_count": notificationCount,
};
}

class Slider {
  int? id;
  int? categoryId;
  int? subCategoryId;
  String? image;

  Slider({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.image,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "image": image,
  };
}
