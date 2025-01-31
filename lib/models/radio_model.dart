class RadioModel implements RadioInterface {
  bool isSelected;
  final String text;
  String id;

  RadioModel(this.isSelected, this.text, this.id);

  @override
  String getText() {
    return text;
  }

  @override
  String getId() {
    return id;
  }

  static List<RadioModel> alertFilterItems() {
    return [
      RadioModel(false, 'Credit', 'credit'),
      RadioModel(false, 'Dark Web', 'dark-web'),
      RadioModel(false, 'Financial Transaction', 'finance'),
      RadioModel(false, 'High Risk', 'high-risk'),
      RadioModel(false, 'Public Record', 'public-record'),
      RadioModel(false, 'Social Media', 'social-media')
    ];
  }
}

//Interface for Radio/Mutliple options display custom component
abstract class RadioInterface {
  String getText();
  String getId();
}
