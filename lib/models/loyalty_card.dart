
class LoyaltyCard {
  String lastFour;
  String name;
  LoyaltyCard({required this.lastFour, required this.name});
  factory LoyaltyCard.fromJson(Map<String,dynamic> json)=> LoyaltyCard(lastFour: json['lastFour'], name: json['name']);
}