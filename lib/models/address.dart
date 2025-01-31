
class Address {
  Address({
    required this.street1,
    this.street2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
  });

  String street1;
  dynamic street2;
  String city;
  String state;
  String zip;
  String country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street1: json["street1"],
        street2: json["street2"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "street1": street1,
        "street2": street2,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
      };
}