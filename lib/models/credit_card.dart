class CreditCard {
  CreditCard({
    required this.description,
    required this.type,
    required this.number,
    required this.hash,
    required this.lastFour,
    required this.expirationMonth,
    required this.expirationYear,
  });

  dynamic description;
  String type;
  String number;
  String hash;
  String lastFour;
  String expirationMonth;
  String expirationYear;

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        description: json["description"],
        type: json["type"],
        number: json["number"],
        hash: json["hash"],
        lastFour: json["lastFour"],
        expirationMonth: json["expirationMonth"],
        expirationYear: json["expirationYear"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "type": type,
        "number": number,
        "hash": hash,
        "lastFour": lastFour,
        "expirationMonth": expirationMonth,
        "expirationYear": expirationYear,
      };
}
