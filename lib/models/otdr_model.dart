class OTDRModel {
  //TODO change distance type to double
  final dynamic distance;
  final dynamic power;

  OTDRModel({this.distance = 0, this.power = 0.0});

  factory OTDRModel.fromJson(Map<String, dynamic> json) {
    return OTDRModel(
      distance: json["distance"] as dynamic,
      power: json["power"] as dynamic,
    );
  }
}
