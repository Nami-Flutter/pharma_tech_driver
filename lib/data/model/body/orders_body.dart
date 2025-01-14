import 'calculate_order_cost_body.dart';

class OrdersBody {
  String? address;
  String? addressDetails;
  double? latitude;
  double? longitude;
  dynamic notes;
  String? payType;
  String? delivery;
  num? netTotal;
  num? driverCost;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  double? taxValue;
  double? grandTotal;
  List<Detail>? details;

  OrdersBody({
    this.address,
    this.addressDetails,
    this.latitude,
    this.longitude,
    this.notes,
    this.payType,
    this.delivery,
    this.netTotal,
    this.driverCost,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.taxValue,
    this.grandTotal,
    this.details,
  });

  factory OrdersBody.fromJson(Map<String, dynamic> json) => OrdersBody(
    address: json["address"],
    addressDetails: json["address_details"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    notes: json["notes"],
    payType: json["pay_type"],
    delivery: json["delivery"],
    netTotal: json["net_total"],
    driverCost: json["driver_cost"],
    isPoints: json["is_points"],
    pointsCount: json["points_count"],
    pointsValue: json["points_value"],
    taxValue: json["tax_value"]?.toDouble(),
    grandTotal: json["grand_total"]?.toDouble(),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "address_details": addressDetails,
    "latitude": latitude,
    "longitude": longitude,
    "notes": notes,
    "pay_type": payType,
    "delivery": delivery,
    "net_total": netTotal,
    "driver_cost": driverCost,
    "is_points": isPoints,
    "points_count": pointsCount,
    "points_value": pointsValue,
    "tax_value": taxValue,
    "grand_total": grandTotal,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

