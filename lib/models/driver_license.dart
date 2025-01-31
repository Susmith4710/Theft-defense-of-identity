
class DriverLicense {
  DriverLicense({
    required this.lastFour,
  });

  String lastFour;

  factory DriverLicense.fromJson(Map<String, dynamic> json) => DriverLicense(
        lastFour: json["lastFour"],
      );
}