
class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
    required this.suffix,
  });

  String first;
  String? middle; // Middle Name is optional
  String last;
  String? suffix;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        middle: json["middle"],
        last: json["last"],
        suffix: json["suffix"],
      );
}
