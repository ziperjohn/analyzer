import 'package:intl/intl.dart';

class InfoModel {
  String locationA;
  String locationB;
  String fiberType;
  String wavelength;
  String lossThr;
  String reflThr;
  String eotThr;
  String bc;
  String index;
  String pulseWidth;
  String sampleSpacing;
  dynamic maxX;
  dynamic maxY;
  dynamic minY;
  dynamic totalLoss;
  dynamic lossStart;
  dynamic lossEnd;
  dynamic orl;
  dynamic orlStart;
  dynamic orlFinish;
  dynamic datetime;

  InfoModel({
    this.locationA = "",
    this.locationB = "",
    this.fiberType = "",
    this.wavelength = "",
    this.lossThr = "",
    this.reflThr = "",
    this.eotThr = "",
    this.bc = "",
    this.index = "",
    this.pulseWidth = "",
    this.sampleSpacing = "",
    this.maxX = 0,
    this.maxY = 0,
    this.minY = 0,
    this.totalLoss = 0,
    this.lossStart = 0,
    this.lossEnd = 0,
    this.orl = 0,
    this.orlStart = 0,
    this.orlFinish = 0,
    this.datetime = 0,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      fiberType: json["fiber type"] as String,
      wavelength: json["wavelength"] as String,
      locationA: json["location A"] as String,
      locationB: json["location B"] as String,
      lossThr: json["loss thr"] as String,
      reflThr: json["refl thr"] as String,
      eotThr: json["EOT thr"] as String,
      index: json["index"] as String,
      bc: json["BC"] as String,
      pulseWidth: json["pulse width"] as String,
      sampleSpacing: json["sample spacing"] as String,
      maxX: json["maxX"] as dynamic,
      maxY: json["maxY"] as dynamic,
      minY: json['minY'] as dynamic,
      totalLoss: json["total loss"] as dynamic,
      lossStart: json["loss start"] as dynamic,
      lossEnd: json["loss end"] as dynamic,
      orl: json["ORL"] as dynamic,
      orlStart: json["ORL start"] as dynamic,
      orlFinish: json["ORL finish"] as dynamic,
      datetime: json["datetime"] as dynamic,
    );
  }

  String getDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(datetime);
    DateFormat formatter = DateFormat("dd.MM.yyyy");
    return formatter.format(date);
  }

  String getTime() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(datetime);
    DateFormat formatter = DateFormat("HH:mm:ss");
    return formatter.format(date);
  }
}
