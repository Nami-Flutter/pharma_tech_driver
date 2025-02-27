import 'dart:io';

class UpdateProfileBody  {
  String? phone;
  String? name;
  String? password;
  File? image;


  UpdateProfileBody({
    this.phone,
    this.name,
    this.password,
    this.image,
  });

  factory UpdateProfileBody.fromJson(Map<String, dynamic> json) => UpdateProfileBody(
    phone: json["phone"],
    password: json["password"],
    name: json["name"],
     image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
    "name": name,
     "image": image,
  };
}
