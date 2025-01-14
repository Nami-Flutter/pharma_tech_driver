
class ProductsModel {
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
  String? prevPageUrl;
  int? to;
  int? total;

  ProductsModel({
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

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
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

class OneProduct {
  int? id;
  String? title;
  String? image;
  int? categoryId;
  Category? category;
  int? subCategoryId;
  Category? subCategory;
  String? details;
  int? salesLimit;
  num? price;
  String? unit;
  num? weightUnit;
  num? priceWeightUnit;
  bool? isOffer;
  int? isActive;
  dynamic offerType;
  num? offerValue;
  String? offerStartDate;
  String? offerEndDate;
  num? oldPrice;
  bool? isFavorite;
  bool? isAvailable;

  OneProduct({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.category,
    this.subCategoryId,
    this.subCategory,
    this.details,
    this.salesLimit,
    this.price,
    this.unit,
    this.weightUnit,
    this.priceWeightUnit,
    this.isOffer,
    this.isActive,
    this.offerType,
    this.offerValue,
    this.offerStartDate,
    this.offerEndDate,
    this.oldPrice,
    this.isFavorite,
    this.isAvailable,
  });

  factory OneProduct.fromJson(Map<String, dynamic> json) => OneProduct(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    categoryId: json["category_id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategoryId: json["sub_category_id"],
    subCategory: json["sub_category"] == null ? null : Category.fromJson(json["sub_category"]),
    details: json["details"],
    salesLimit: json["sales_limit"],
    price: json["price"],
    unit: json["unit"],
    weightUnit: json["weight_unit"],
    priceWeightUnit: json["price_weight_unit"],
    isOffer: json["is_offer"],
    isActive: json["is_active"],
    offerType: json["offer_type"],
    offerValue: json["offer_value"],
    offerStartDate: json["offer_start_date"] ,
    offerEndDate: json["offer_end_date"] ,
    oldPrice: json["old_price"],
    isFavorite: json["is_favorite"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "category_id": categoryId,
    "category": category?.toJson(),
    "sub_category_id": subCategoryId,
    "sub_category": subCategory?.toJson(),
    "details": details,
    "sales_limit": salesLimit,
    "price": price,
    "unit": unit,
    "weight_unit": weightUnit,
    "price_weight_unit": priceWeightUnit,
    "is_offer": isOffer,
    "is_active": isActive,
    "offer_type": offerType,
    "offer_value": offerValue,
    "offer_start_date": offerStartDate,
    "offer_end_date": offerEndDate,
    "old_price": oldPrice,
    "is_favorite": isFavorite,
    "is_available": isAvailable,
  };
}
class Category {
  int? id;
  String? image;
  String? title;
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
      title: json["title"],
      subCategories: json["sub_categories"] == null ? [] : List<Category>.from(json["sub_categories"]!.map((x) => Category.fromJson(x))),
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