class LoginBody {
  String? phoneCode;
  String? phone;

  LoginBody({
    this.phoneCode,
    this.phone,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
    phoneCode: json["phone_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone_code": phoneCode,
    "phone": phone,
  };
}
