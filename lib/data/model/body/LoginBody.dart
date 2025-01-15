class LoginBody {
  String? password;
  String? phone;

  LoginBody({
    this.password,
    this.phone,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
    password: json["password"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "phone": phone,
  };
}
