import 'package:idd_app/models/alert_list.dart';

class CyberbullyingAlert extends Alert {
  String interactionId;
  String alertType;
  String authorName;
  bool isChild;
  String disposition;
  String text;
  String userId;
  List<SocialInteraction> evidence;

  CyberbullyingAlert.fromJson(Map<String, dynamic> json)
      : interactionId = json["interactionId"],
        alertType = json["alertType"],
        authorName = json["authorName"],
        isChild = json["isChild"],
        disposition = json["disposition"],
        text = json["text"],
        userId = json["userId"],
        evidence = List.from(
            json["evidence"].map((x) => SocialInteraction.fromJson(x))),
        super.fromJson(json);
}

class SocialInteraction {
  String text;
  String createdAt;
  bool selfAuthored;
  String authorName;
  bool abbreviated;
  String link;

  SocialInteraction.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        createdAt = json["createdAt"],
        selfAuthored = json["selfAuthore"],
        authorName = json["authorName"],
        abbreviated = json["abbreviated"],
        link = json["link"];
}
