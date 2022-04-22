import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpandableCard extends StatelessWidget {
  final EventModel event;
  final int index;
  const ExpandableCard({Key? key, required this.event, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return ExpandableNotifier(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${_locale!.event} ${index + 1}", style: Theme.of(context).textTheme.subtitle2),
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: FontAwesomeIcons.chevronDown,
                    collapseIcon: FontAwesomeIcons.chevronUp,
                    iconSize: 17,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    iconColor: primaryColor,
                  ),
                  header: Text(event.type),
                  collapsed: Container(),
                  expanded: Column(
                    children: [
                      const CustomDivider(),
                      CardRow(title: "${_locale.distance}:", value: "${event.distance} km"),
                      CardRow(title: "${_locale.slope}:", value: "${event.slope} -"),
                      CardRow(title: "${_locale.splice_loss}:", value: "${event.spliceLoss} dB"),
                      CardRow(title: "${_locale.reflection_loss}:", value: "${event.reflLoss} dB"),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
