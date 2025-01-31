class FinancialAccount {

  String lastFour;
  String type;
  FinancialAccount({required this.lastFour, required this.type});

  factory FinancialAccount.fromJson(Map<String, dynamic> json) => FinancialAccount(
        lastFour: json["lastFour"],
        type: json["type"]
      );

}