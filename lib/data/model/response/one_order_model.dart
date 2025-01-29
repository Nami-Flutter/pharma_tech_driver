
class OneOrderModel {
  Data? data;
  String? message;
  int? code;

  OneOrderModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneOrderModel.fromJson(Map<String, dynamic> json) => OneOrderModel(
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
  int? id;
  int? delegateId;
  int? orderId;
  int? adminId;
  String? status;
  num? total;
  Order? order;
  List<Detail>? details;
  String? createdAt;

  Data({
    this.id,
    this.delegateId,
    this.orderId,
    this.total,
    this.adminId,
    this.status,
    this.order,
    this.details,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    delegateId: json["delegate_id"],
    orderId: json["order_id"],
    adminId: json["admin_id"],
    status: json["status"],
    total: json["total"],
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "delegate_id": delegateId,
    "order_id": orderId,
    "admin_id": adminId,
    "status": status,
    "total": total,
    "order": order?.toJson(),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
    "created_at": createdAt,
  };
}

class Detail {
  int? id;
  int? delegateOrderId;
  int? orderDetailId;
  MainOrderDetail? mainOrderDetail;

  Detail({
    this.id,
    this.delegateOrderId,
    this.orderDetailId,
    this.mainOrderDetail,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    delegateOrderId: json["delegate_order_id"],
    orderDetailId: json["order_detail_id"],
    mainOrderDetail: json["main_order_detail"] == null ? null : MainOrderDetail.fromJson(json["main_order_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "delegate_order_id": delegateOrderId,
    "order_detail_id": orderDetailId,
    "main_order_detail": mainOrderDetail?.toJson(),
  };
}

class MainOrderDetail {
  int? id;
  int? productId;
  Product? product;
  int? qty;
  num? netCost;
  num? total;

  MainOrderDetail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory MainOrderDetail.fromJson(Map<String, dynamic> json) => MainOrderDetail(
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
  dynamic howToUse;
  dynamic howToStore;
  num? salesLimit;
  num? price;
  String? unit;
  double? weightUnit;
  double? priceWeightUnit;
  bool? isOffer;
  int? isActive;
  dynamic offerType;
  num? offerValue;
  String? offerStartDate;
  String? offerEndDate;
  num? oldPrice;
  bool? isFavorite;

  Product({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.category,
    this.details,
    this.howToUse,
    this.howToStore,
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
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    categoryId: json["category_id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    details: json["details"],
    howToUse: json["how_to_use"],
    howToStore: json["how_to_store"],
    salesLimit: json["sales_limit"],
    price: json["price"],
    unit: json["unit"],
    weightUnit: json["weight_unit"]?.toDouble(),
    priceWeightUnit: json["price_weight_unit"]?.toDouble(),
    isOffer: json["is_offer"],
    isActive: json["is_active"],
    offerType: json["offer_type"],
    offerValue: json["offer_value"],
    offerStartDate: json["offer_start_date"] ,
    offerEndDate: json["offer_end_date"],
    oldPrice: json["old_price"],
    isFavorite: json["is_favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "category_id": categoryId,
    "category": category?.toJson(),
    "details": details,
    "how_to_use": howToUse,
    "how_to_store": howToStore,
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
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "created_at": createdAt,
  };
}

class Order {
  int? id;
  int? userId;
  OrderUser? user;
  dynamic driverCancelReason;
  String? address;
  dynamic addressDetails;
  double? latitude;
  double? longitude;
  String? status;
  bool? isCollected;
  String? payType;
  bool? isPaid;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  num? driverCost;
  num? netTotal;
  num? taxValue;
  num? deliveryPrice;
  num? grandTotal;
  String? notes;
  String? createdAt;
  String? date;
  String? time;

  Order({
    this.id,
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
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.deliveryPrice,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    user: json["user"] == null ? null : OrderUser.fromJson(json["user"]),
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
    driverCost: json["driver_cost"],
    netTotal: json["net_total"],
    taxValue: json["tax_value"],
    deliveryPrice: json["delivery_price"],
    grandTotal: json["grand_total"],
    notes: json["notes"],
    createdAt: json["created_at"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "driver_cost": driverCost,
    "net_total": netTotal,
    "tax_value": taxValue,
    "delivery_price": deliveryPrice,
    "grand_total": grandTotal,
    "notes": notes,
    "created_at": createdAt,
    "date": date,
    "time": time,
  };
}

class OrderUser {
  UserUser? user;

  OrderUser({
    this.user,
  });

  factory OrderUser.fromJson(Map<String, dynamic> json) => OrderUser(
    user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class UserUser {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  String? image;
  num? points;
  String? invitationCode;
  int? cityId;
  City? city;

  UserUser({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
    this.cityId,
    this.city,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
    id: json["id"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    invitationCode: json["invitation_code"],
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "phone_code": phoneCode,
    "phone": phone,
    "image": image,
    "points": points,
    "invitation_code": invitationCode,
    "city_id": cityId,
    "city": city?.toJson(),
  };
}

class City {
  int? id;
  String? title;
  num? deliveryCost;
  int? regionId;

  City({
    this.id,
    this.title,
    this.deliveryCost,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    deliveryCost: json["delivery_cost"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "delivery_cost": deliveryCost,
    "region_id": regionId,
  };
}
