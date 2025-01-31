
class Phone {
  Phone({
    required this.number,
    required this.type,
  });

  String number;
  String type;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: json["number"],
        type: json["type"],
      );
}
