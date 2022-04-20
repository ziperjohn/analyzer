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
}
