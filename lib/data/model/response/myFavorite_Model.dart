
import 'package:pharma_tech_driver/data/model/response/productsModel.dart';

class MyFavoriteModel {
  List<OneProduct>? data;
  String? message;
  int? code;

  MyFavoriteModel({
    this.data,
    this.message,
    this.code,
  });

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) => MyFavoriteModel(
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

