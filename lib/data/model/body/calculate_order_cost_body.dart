
import '../../datasource/locale/locale_data_source.dart';

class CalculateOrderCost {
  double? latitude;
  double? longitude;
  List<Detail>? details;

  CalculateOrderCost({
    this.latitude,
    this.longitude,
    this.details,
  });

  factory CalculateOrderCost.fromJson(Map<String, dynamic> json) => CalculateOrderCost(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  int? productId;
  int? qty;
  double? netCost;

  Detail({
    this.productId,
    this.qty,
    this.netCost,

  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    productId: json["product_id"],
    qty: json["qty"],
    netCost: json["net_cost"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "qty": qty,
    "net_cost": netCost,
  };
}
