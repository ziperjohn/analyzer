class PortModel {
  int id;
  String state;

  PortModel({this.id = 0, this.state = ""});

  factory PortModel.fromJson(Map<String, dynamic> json) {
    return PortModel(
      id: json["id"] as int,
      state: json["state"] as String,
    );
  }
}
