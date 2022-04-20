class InfoModel {
  String locationA;
  String locationB;
  String fiberID;
  String wavelength;
  String datetime;
  dynamic range;
  dynamic maxX;
  dynamic maxY;
  dynamic minY;
  dynamic totalLoss;
  dynamic lossStart;
  dynamic lossEnd;
  dynamic orl;
  dynamic orlStart;
  dynamic orlFinish;

  InfoModel({
    this.locationA = "",
    this.locationB = "",
    this.fiberID = "",
    this.wavelength = "",
    this.datetime = "",
    this.range = 0,
    this.maxX = 0,
    this.maxY = 0,
    this.minY = 0,
    this.totalLoss = 0,
    this.lossStart = 0,
    this.lossEnd = 0,
    this.orl = 0,
    this.orlStart = 0,
    this.orlFinish = 0,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      locationA: json["location A"] as String,
      locationB: json["location B"] as String,
      fiberID: json["fiber ID"] as String,
      wavelength: json["wavelength"] as String,
      datetime: json["date/time"] as String,
      range: json["range"] as dynamic,
      maxX: json["maxX"] as dynamic,
      maxY: json["maxY"] as dynamic,
      minY: json['minY'] as dynamic,
      totalLoss: json["total loss"] as dynamic,
      lossStart: json["loss start"] as dynamic,
      lossEnd: json["loss end"] as dynamic,
      orl: json["ORL"] as dynamic,
      orlStart: json["ORL start"] as dynamic,
      orlFinish: json["ORL finish"] as dynamic,
    );
  }
}
