
class Employee {
  Employee({
    this.createdAt,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.department,
    this.birthday,
    this.country,
    this.id,
  });

  DateTime ?createdAt;
  String ?name;
  String ?avatar;
  String ?email;
  String ?phone;
  List<String>? department;
  DateTime ?birthday;
  String ?country;
  String ?id;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    email: json["email"],
    phone: json["phone"],
    department: List<String>.from(json["department"].map((x) => x)),
    birthday: DateTime.parse(json["birthday"]),
    country: json["country"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt!.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "email": email,
    "phone": phone,
    "department": List<dynamic>.from(department!.map((x) => x)),
    "birthday": birthday!.toIso8601String(),
    "country": country,
    "id": id,
  };
}
