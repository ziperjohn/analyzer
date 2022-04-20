class PointModel {
  final dynamic distance;
  final dynamic power;

  PointModel({this.distance = 0.0, this.power = 0.0});

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(
      distance: json["distance"] as dynamic,
      power: json["power"] as dynamic,
    );
  }
}
