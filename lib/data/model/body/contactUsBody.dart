class ContactUsBody {
  String? name;
  String? email;
  String? phone;
  String? subject;
  String? message;

  ContactUsBody({
    this.name,
    this.email,
    this.phone,
    this.subject,
    this.message,


  });

  factory ContactUsBody.fromJson(Map<String, dynamic> json) => ContactUsBody(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    subject: json["subject"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "subject": subject,
    "message": message,



  };
}