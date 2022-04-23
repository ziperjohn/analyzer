import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventModel {
  String type;
  String distance;
  String slope;
  String spliceLoss;
  String reflLoss;
  String comments;

  EventModel({
    this.type = "",
    this.distance = "",
    this.slope = "",
    this.spliceLoss = "",
    this.reflLoss = "",
    this.comments = "",
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      type: json["type"] as String,
      distance: json["distance"] as String,
      slope: json["slope"] as String,
      spliceLoss: json["splice loss"] as String,
      reflLoss: json["refl loss"] as String,
      comments: json["comments"] as String,
    );
  }

  String getEventType(AppLocalizations locale) {
    var splitedType = type.split(" ");
    String code = splitedType[0];
    String eventType = splitedType[2];

    switch (eventType) {
      case "reflection":
        return "${locale.reflection} - $code";
      case "loss/drop/gain":
        return "${locale.loss_drop_gain} - $code";
      default:
        return type;
    }
  }
}
