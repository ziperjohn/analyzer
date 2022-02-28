class OTDRModel {
  //TODO change distance type to double
  final int distance;
  final double power;

  OTDRModel({this.distance = 0, this.power = 0.0});

  factory OTDRModel.fromJson(Map<String, dynamic> json) {
    return OTDRModel(
      distance: json["distance"] as int,
      power: json["power"] as double,
    );
  }
}
