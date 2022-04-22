import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LocationDateCard extends StatelessWidget {
  final InfoModel info;
  const LocationDateCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarColumn(mark: "A", location: info.locationA),
                IconColumn(distance: info.maxX),
                AvatarColumn(mark: "B", location: info.locationB),
              ],
            ),
            const CustomDivider(),
            CardRow(title: "Date:", value: "20.4.2022"),
            CardRow(title: "Time:", value: "13:35"),
          ],
        ),
      ),
    );
  }
}

class IconColumn extends StatelessWidget {
  final double distance;
  const IconColumn({Key? key, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PulsingIcon(icon: Icons.double_arrow_rounded, color: whiteColor, size: 40),
        Text("$distance km"),
      ],
    );
  }
}

class AvatarColumn extends StatelessWidget {
  final String mark;
  final String location;

  const AvatarColumn({Key? key, required this.mark, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: primaryColor, child: Text(mark, style: Theme.of(context).textTheme.bodyText2)),
        Text(location),
      ],
    );
  }
}
