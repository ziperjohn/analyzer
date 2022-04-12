class AnalyzerModel {
  String id;
  String name;
  String place;
  String ipAddress;
  String port;
  String key;

  AnalyzerModel(
      {this.id = "", this.name = "", this.place = "", this.ipAddress = "", this.port = "", this.key = ""});

  factory AnalyzerModel.fromJson(Map<dynamic, dynamic> json) {
    return AnalyzerModel(
      id: json["id"],
      name: json["name"],
      place: json["place"],
      ipAddress: json["ipAddress"],
      port: json["port"],
      key: json["key"],
    );
  }
}
