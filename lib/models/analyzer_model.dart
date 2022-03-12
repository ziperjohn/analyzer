class AnalyzerModel {
  String id;
  String name;
  String place;
  String ipAddress;
  String port;

  AnalyzerModel({this.id = "", this.name = "", this.place = "", this.ipAddress = "", this.port = ""});

  factory AnalyzerModel.fromJson(Map<dynamic, dynamic> json) {
    return AnalyzerModel(
      id: json["id"],
      name: json["name"],
      place: json["place"],
      ipAddress: json["ipAddress"],
      port: json["port"],
    );
  }
}
