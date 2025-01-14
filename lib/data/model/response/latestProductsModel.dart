
import 'package:pharma_tech_driver/data/model/response/productsModel.dart';

class LatestProductsModel {
  List<OneProduct>? data;
  String? message;
  int? code;

  LatestProductsModel({
    this.data,
    this.message,
    this.code,
  });

  factory LatestProductsModel.fromJson(Map<String, dynamic> json) => LatestProductsModel(
      data: json["data"] == null ? [] : List<OneProduct>.from(json["data"]!.map((x) => OneProduct.fromJson(x))),
  message: json["message"],
  code: json["code"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message,
  "code": code,
};
}

