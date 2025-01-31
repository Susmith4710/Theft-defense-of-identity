class InsuranceProviderAccount {
  String lastFour;
  String insuranceProvider;
  InsuranceProviderAccount(
      {required this.lastFour, required this.insuranceProvider});

  factory InsuranceProviderAccount.fromJson(Map<String, dynamic> json) =>
      InsuranceProviderAccount(
          lastFour: json["lastFour"],
          insuranceProvider: json['insuranceProvider']);
}
