// ignore_for_file: constant_identifier_names
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

enum Status { ON, OFF, ECHO, ERROR }

Map<Status, Color> colorMap = {
  Status.ERROR: redColor,
  Status.ECHO: orangeColor,
  Status.ON: greenColor,
  Status.OFF: lightGrayColor,
};

class PortModel {
  int id;
  Status status;
  Color color;

  PortModel({this.id = 0, this.status = Status.OFF, this.color = redColor});

  factory PortModel.fromJson(Map<String, dynamic> json) {
    return PortModel(
      id: json["id"] as int,
      status: Status.values.byName(json["status"] as String),
      color: colorMap[Status.values.byName(json["status"] as String)] ?? blackColor,
    );
  }
}
