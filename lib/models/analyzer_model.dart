class Analyzer {
  final int id;
  String name;
  String? place;

  int get getId => id;
  String get getName => name;
  String? get getPlace => place;

  Analyzer({required this.id, required this.name, this.place});
}
