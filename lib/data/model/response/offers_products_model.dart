
import 'package:pharma_tech_driver/data/model/response/productsModel.dart';

class ListOffersProductsModel {
  List<OneProduct>? data;
  String? message;
  int? code;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  ListOffersProductsModel({
    this.data,
    this.message,
    this.code,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ListOffersProductsModel.fromJson(Map<String, dynamic> json) => ListOffersProductsModel(
      data: json["data"] == null ? [] : List<OneProduct>.from(json["data"]!.map((x) => OneProduct.fromJson(x))),
  message: json["message"],
  code: json["code"],
  currentPage: json["current_page"],
  firstPageUrl: json["first_page_url"],
  from: json["from"],
  lastPage: json["last_page"],
  lastPageUrl: json["last_page_url"],
  nextPageUrl: json["next_page_url"],
  path: json["path"],
  perPage: json["per_page"],
  prevPageUrl: json["prev_page_url"],
  to: json["to"],
  total: json["total"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message,
  "code": code,
  "current_page": currentPage,
  "first_page_url": firstPageUrl,
  "from": from,
  "last_page": lastPage,
  "last_page_url": lastPageUrl,
  "next_page_url": nextPageUrl,
  "path": path,
  "per_page": perPage,
  "prev_page_url": prevPageUrl,
  "to": to,
  "total": total,
};
}

class Category {
  int? id;
  String? image;
  Title? title;
  List<Category>? subCategories;
  DateTime? createdAt;

  Category({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"],
      image: json["image"],
      title: titleValues.map[json["title"]]!,
      subCategories: json["sub_categories"] == null ? [] : List<Category>.from(json["sub_categories"]!.map((x) => Category.fromJson(x))),
  createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "image": image,
  "title": titleValues.reverse[title],
  "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
  "created_at": createdAt?.toIso8601String(),
};
}

enum Title {
  pharma_tech_driver,
  EMPTY
}

final titleValues = EnumValues({
  "عروض pharma_tech_driver": Title.pharma_tech_driver,
  "العروض و الخصومات": Title.EMPTY
});

enum OfferType {
  PER,
  VALUE
}

final offerTypeValues = EnumValues({
  "per": OfferType.PER,
  "value": OfferType.VALUE
});

enum Unit {
  EMPTY,
  PURPLE,
  UNIT
}

final unitValues = EnumValues({
  "قطعة": Unit.EMPTY,
  "كيلو جرام": Unit.PURPLE,
  "ربع كيلو جرام": Unit.UNIT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
