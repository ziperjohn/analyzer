import 'dart:convert';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/services/services.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PortSelection extends StatefulWidget {
  final List<PortModel> portlist;
  final WebSocketService webSocketService;

  const PortSelection({Key? key, required this.portlist, required this.webSocketService}) : super(key: key);

  @override
  State<PortSelection> createState() => _PortSelectionState();
}

class _PortSelectionState extends State<PortSelection> {
  int? index;

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(index != null
              ? "${_locale!.selected_port}: ${index! + 1}"
              : "${_locale!.selected_port}: ${_locale.none}"),
        ),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () => clearPortIndex(),
                icon: const Icon(Icons.close),
                iconSize: 35,
              ),
              for (var port in widget.portlist)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ChoiceChip(
                    avatar: CircleAvatar(
                        child: Text(
                          "${port.id + 1}",
                          style:
                              const TextStyle(color: whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: port.color),
                    label: Text(_locale.port),
                    selected: index == port.id,
                    onSelected: (bool selected) => setPortIndex(port, selected),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  void clearPortIndex() {
    widget.webSocketService.sendData(jsonEncode({"key": widget.webSocketService.key, "selectedPort": null}));
    setState(() {
      index = null;
    });
  }

  void setPortIndex(PortModel port, bool selected) {
    if (!selected || port.status == Status.ERROR || port.status == Status.OFF) {
      return;
    }
    widget.webSocketService
        .sendData(jsonEncode({"key": widget.webSocketService.key, "selectedPort": port.id}));
    setState(() {
      index = port.id;
    });
  }
}
