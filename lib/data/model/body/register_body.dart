import 'dart:io';

class RegisterBody  {
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  File? image;
  String? invitationCode;
  int? cityId;

  RegisterBody({
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.invitationCode,
    this.cityId,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    // image: json["image"],
    invitationCode: json["invitation_code"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone_code": phoneCode,
    "phone": phone,
    // "image": image,
    "invitation_code": invitationCode,
    "city_id": cityId,
  };
}
