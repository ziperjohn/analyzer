class Analyzer {
  String id;
  String name;
  String place;
  String ipAddress;
  String port;

  Analyzer({this.id = "", this.name = "", this.place = "", this.ipAddress = "", this.port = ""});

  factory Analyzer.fromJson(Map<dynamic, dynamic> json) {
    return Analyzer(
      id: json["id"],
      name: json["name"],
      place: json["place"],
      ipAddress: json["ipAddress"],
      port: json["port"],
    );
  }
}
