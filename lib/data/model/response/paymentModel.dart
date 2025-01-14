class PaymentModel {
  PaymentData? data;
  String? message;
  int? code;

  PaymentModel({
    this.data,
    this.message,
    this.code,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    data: json["data"] == null ? null : PaymentData.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class PaymentData {
  String? redirectUrl;
  String? paymentSuccess;
  String? paymentaFiled;

  PaymentData({
    this.redirectUrl,
    this.paymentSuccess,
    this.paymentaFiled,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
    redirectUrl: json["redirectUrl"],
    paymentSuccess: json["paymentSuccess"],
    paymentaFiled: json["paymentaFiled"],
  );

  Map<String, dynamic> toJson() => {
    "redirectUrl": redirectUrl,
    "paymentSuccess": paymentSuccess,
    "paymentaFiled": paymentaFiled,
  };
}
