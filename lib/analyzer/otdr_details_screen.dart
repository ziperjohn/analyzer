import 'package:analyzer_app/analyzer/analyzer.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OTDRDetailsScreen extends StatelessWidget {
  final List<EventModel> eventList;
  final InfoModel info;

  const OTDRDetailsScreen({Key? key, required this.eventList, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTDR details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleList(title: "Location"),
              TitleList(title: "Info"),
              InfoCard(info: info),
              TitleList(title: "Key event"),
            ],
          ),
        ),
      ),
    );
  }
}
