

class CheckIn {
  CheckIn({
    this.checkin,
    this.location,
    this.purpose,
    this.id,
    this.employeeId,
  });

  DateTime? checkin;
  String? location;
  String? purpose;
  String? id;
  String? employeeId;

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
        checkin: DateTime.parse(json["checkin"]),
        location: json["location"],
        purpose: json["purpose"],
        id: json["id"],
        employeeId: json["employeeId"],
      );

  Map<String, dynamic> toJson() => {
        "checkin": checkin!.toIso8601String(),
        "location": location,
        "purpose": purpose,
        "id": id,
        "employeeId": employeeId,
      };
}
