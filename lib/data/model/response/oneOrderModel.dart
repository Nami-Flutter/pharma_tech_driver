// To parse this JSON data, do
//
//     final oneOrderModel = oneOrderModelFromJson(jsonString);

import 'dart:convert';

OneOrderModel oneOrderModelFromJson(String str) => OneOrderModel.fromJson(json.decode(str));

String oneOrderModelToJson(OneOrderModel data) => json.encode(data.toJson());

class OneOrderModel {
  OneOrder? data;
  String? message;
  int? code;

  OneOrderModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneOrderModel.fromJson(Map<String, dynamic> json) => OneOrderModel(
    data: json["data"] == null ? null : OneOrder.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class OneOrder {
  int? id;
  int? branchId;
  Branch? branch;
  int? userId;
  DataUser? user;
  dynamic driverCancelReason;
  String? address;
  String? addressDetails;
  double? latitude;
  double? longitude;
  String? status;
  bool? isCollected;
  String? payType;
  bool? isPaid;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  int? driverId;
  Driver? driver;
  double? driverCost;
  num? netTotal;
  double? taxValue;
  double? grandTotal;
  dynamic notes;
  String? createdAt;
  String? date;
  String? time;
  num? deliveryPrice;
  List<Detail>? details;

  OneOrder({
    this.id,
    this.branchId,
    this.branch,
    this.userId,
    this.user,
    this.driverCancelReason,
    this.address,
    this.addressDetails,
    this.latitude,
    this.longitude,
    this.status,
    this.isCollected,
    this.payType,
    this.isPaid,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.driverId,
    this.driver,
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
    this.deliveryPrice,
    this.details,
  });

  factory OneOrder.fromJson(Map<String, dynamic> json) => OneOrder(
      id: json["id"],
      branchId: json["branch_id"],
      branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
      userId: json["user_id"],
      user: json["user"] == null ? null : DataUser.fromJson(json["user"]),
      driverCancelReason: json["driver_cancel_reason"],
      address: json["address"],
      addressDetails: json["address_details"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      status: json["status"],
      isCollected: json["is_collected"],
      payType: json["pay_type"],
      isPaid: json["is_paid"],
      isPoints: json["is_points"],
      pointsCount: json["points_count"],
      pointsValue: json["points_value"],
      driverId: json["driver_id"],
      driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
      driverCost: json["driver_cost"]?.toDouble(),
      netTotal: json["net_total"],
      taxValue: json["tax_value"]?.toDouble(),
      grandTotal: json["grand_total"]?.toDouble(),
      notes: json["notes"],
      createdAt: json["created_at"],
      date: json["date"],
      time: json["time"],
      deliveryPrice: json["delivery_price"],
      details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "branch_id": branchId,
  "branch": branch?.toJson(),
  "user_id": userId,
  "user": user?.toJson(),
  "driver_cancel_reason": driverCancelReason,
  "address": address,
  "address_details": addressDetails,
  "latitude": latitude,
  "longitude": longitude,
  "status": status,
  "is_collected": isCollected,
  "pay_type": payType,
  "is_paid": isPaid,
  "is_points": isPoints,
  "points_count": pointsCount,
  "points_value": pointsValue,
  "driver_id": driverId,
  "driver": driver?.toJson(),
  "driver_cost": driverCost,
  "net_total": netTotal,
  "tax_value": taxValue,
  "grand_total": grandTotal,
  "notes": notes,
  "created_at": createdAt,
  "date": date,
  "time": time,
  "delivery_price": deliveryPrice,
  "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
};
}

class Branch {
  int? id;
  String? title;
  String? email;
  dynamic phone;
  int? regionId;
  Region? region;
  int? cityId;
  City? city;
  double? longitude;
  double? latitude;
  double? distance;
  String? address;
  String? addressDetails;
  bool? isMain;

  Branch({
    this.id,
    this.title,
    this.email,
    this.phone,
    this.regionId,
    this.region,
    this.cityId,
    this.city,
    this.longitude,
    this.latitude,
    this.distance,
    this.address,
    this.addressDetails,
    this.isMain,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    title: json["title"],
    email: json["email"],
    phone: json["phone"],
    regionId: json["region_id"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    address: json["address"],
    addressDetails: json["address_details"],
    isMain: json["is_main"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "email": email,
    "phone": phone,
    "region_id": regionId,
    "region": region?.toJson(),
    "city_id": cityId,
    "city": city?.toJson(),
    "longitude": longitude,
    "latitude": latitude,
    "distance": distance,
    "address": address,
    "address_details": addressDetails,
    "is_main": isMain,
  };
}

class City {
  int? id;
  String? title;
  int? regionId;

  City({
    this.id,
    this.title,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
  };
}

class Region {
  int? id;
  String? title;

  Region({
    this.id,
    this.title,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class Detail {
  int? id;
  int? productId;
  Product? product;
  num? qty;
  num? netCost;
  num? total;

  Detail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    productId: json["product_id"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    qty: json["qty"],
    netCost: json["net_cost"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product": product?.toJson(),
    "qty": qty,
    "net_cost": netCost,
    "total": total,
  };
}

class Product {
  int? id;
  String? title;
  String? image;
  int? categoryId;
  Category? category;
  String? details;
  num? price;
  num? priceWeightUnit;
  String? unit;
  bool? isOffer;
  String? offerType;
  num? offerValue;
  String? offerStartDate;
  String? offerEndDate;
  num? oldPrice;
  bool? isFavorite;
  bool? isAvailable;
  num? weightUnit;

  Product({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.category,
    this.details,
    this.price,
    this.priceWeightUnit,
    this.unit,
    this.isOffer,
    this.offerType,
    this.offerValue,
    this.offerStartDate,
    this.offerEndDate,
    this.oldPrice,
    this.isFavorite,
    this.isAvailable,
    this.weightUnit,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    categoryId: json["category_id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    details: json["details"],
    price: json["price"],
    priceWeightUnit: json["price_weight_unit"],
    unit: json["unit"],
    isOffer: json["is_offer"],
    offerType: json["offer_type"],
    offerValue: json["offer_value"],
    offerStartDate: json["offer_start_date"] ,
    offerEndDate: json["offer_end_date"] ,
    oldPrice: json["old_price"],
    isFavorite: json["is_favorite"],
    isAvailable: json["is_available"],
    weightUnit: json["weight_unit"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "category_id": categoryId,
    "category": category?.toJson(),
    "details": details,
    "price": price,
    "price_weight_unit": priceWeightUnit,
    "unit": unit,
    "is_offer": isOffer,
    "offer_type": offerType,
    "offer_value": offerValue,
    "offer_start_date": offerStartDate,
    "offer_end_date": offerEndDate,
    "old_price": oldPrice,
    "is_favorite": isFavorite,
    "is_available": isAvailable,
    "weight_unit": weightUnit,
  };
}

class Category {
  int? id;
  String? image;
  String? title;
  String? createdAt;

  Category({
    this.id,
    this.image,
    this.title,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    createdAt: json["created_at"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "created_at": createdAt,
  };
}

class Driver {
  int? id;
  String? image;
  String? name;
  String? phone;
  int? isAvailable;

  Driver({
    this.id,
    this.image,
    this.name,
    this.phone,
    this.isAvailable,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    phone: json["phone"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "phone": phone,
    "is_available": isAvailable,
  };
}

class DataUser {
  UserUser? user;

  DataUser({
    this.user,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class UserUser {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  String? image;
  num? points;
  String? invitationCode;

  UserUser({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
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
