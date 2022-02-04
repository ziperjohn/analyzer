class Analyzer {
  String id;
  String name;
  String place;

  Analyzer({this.id = "", this.name = "", this.place = ""});

  factory Analyzer.fromJson(Map<dynamic, dynamic> json) {
    return Analyzer(
      id: json["id"],
      name: json["name"],
      place: json["place"],
    );
  }
}
