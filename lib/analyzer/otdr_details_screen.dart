import 'package:analyzer_app/analyzer/analyzer.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OTDRDetailsScreen extends StatelessWidget {
  final List<EventModel> eventList;
  final InfoModel info;

  const OTDRDetailsScreen({Key? key, required this.eventList, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("OTDR details"),
      ),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleList(title: _locale!.general_info),
                  LocationDateCard(info: info),
                  TitleList(title: "Measurment"),
                  InfoCard(info: info),
                  TitleList(title: "Key event"),
                  ExpandableCard(event: eventList[index], index: index),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: ExpandableCard(event: eventList[index], index: index),
          );
        },
      ),
    );
  }
}







          // return ExpandableCard(event: eventList[index]);
        // },
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         TitleList(title: "Location"),
      //         TitleList(title: "Info"),
      //         InfoCard(info: info),
      //         TitleList(title: "Key event"),

      //       ],
      //     ),
      //   ),
      // ),
//     );
//   }
// }

