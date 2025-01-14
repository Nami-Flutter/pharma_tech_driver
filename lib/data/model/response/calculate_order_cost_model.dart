
class CalculateOrderCostModel {
  Data? data;
  String? message;
  int? code;

  CalculateOrderCostModel({
    this.data,
    this.message,
    this.code,
  });

  factory CalculateOrderCostModel.fromJson(Map<String, dynamic> json) => CalculateOrderCostModel(
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
  num? points;
  num? willDiscPoints;
  num? totalPoints;
  num? netTotal;
  double? taxValue;
  double? totalTax;
  num? driverCost;
  num? deliveryPrice;
  double? grandTotalWithoutDriverCost;
  double? grandTotal;

  Data({
    this.points,
    this.willDiscPoints,
    this.totalPoints,
    this.netTotal,
    this.taxValue,
    this.totalTax,
    this.driverCost,
    this.deliveryPrice,
    this.grandTotalWithoutDriverCost,
    this.grandTotal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    points: json["points"],
    willDiscPoints: json["will_disc_points"],
    totalPoints: json["total_points"],
    netTotal: json["net_total"],
    taxValue: json["tax_value"]?.toDouble(),
    totalTax: json["total_tax"]?.toDouble(),
    driverCost: json["driver_cost"],
    deliveryPrice: json["delivery_price"],
    grandTotalWithoutDriverCost: json["grand_total_without_driver_cost"]?.toDouble(),
    grandTotal: json["grand_total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "points": points,
    "will_disc_points": willDiscPoints,
    "total_points": totalPoints,
    "net_total": netTotal,
    "tax_value": taxValue,
    "total_tax": totalTax,
    "driver_cost": driverCost,
    "delivery_price": deliveryPrice,
    "grand_total_without_driver_cost": grandTotalWithoutDriverCost,
    "grand_total": grandTotal,
  };
}
