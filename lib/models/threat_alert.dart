import 'alert_list.dart';

class ThreatAlert extends Alert {

  String body;
  List<String> tags;
  String publishedAt;
  String title;
  ThreatAlertSource source;

  ThreatAlert.fromJson(Map<String,dynamic> json):
  body = json["body"],
  publishedAt = json["publishedAt"],
  title = json["title"],
  source = ThreatAlertSource.fromJson(json["source"]),
  tags = List<String>.from(
            json["tags"].map((x) => x)),
  super.fromJson(json);
}

class ThreatAlertSource {
  String url;
  String title;
  String correlationId;
  String organization;
  String displayName;
  String author;
  String publishedAt;
  ThreatAlertSource.fromJson(Map<String,dynamic> json):
    url=json["url"],
    title=json["title"],
    correlationId=json["correlationId"],
    organization=json["organization"],
    displayName=json["displayName"],
    author=json["author"],
    publishedAt=json["publishedAt"];
}