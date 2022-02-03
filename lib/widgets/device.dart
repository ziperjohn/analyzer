import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AnalyzerDevice extends StatelessWidget {
  const AnalyzerDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      decoration: const BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "VUT Analyzer",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Port(id: 1, color: greenColor),
              Port(id: 2, color: greenColor),
              Port(id: 3, color: greenColor),
              Port(id: 4, color: greenColor),
              Port(id: 5, color: greenColor),
              Port(id: 6, color: orangeColor),
              Port(id: 7, color: redColor),
              Port(id: 8, color: greenColor),
              Port(id: 9, color: greenColor),
              Port(id: 10, color: greenColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Port(id: 11, color: greenColor),
              Port(id: 12, color: orangeColor),
              Port(id: 13, color: greenColor),
              Port(id: 14, color: orangeColor),
              Port(id: 15, color: greenColor),
              Port(id: 16, color: greenColor),
              Port(id: 17, color: redColor),
              Port(id: 18, color: greenColor),
              Port(id: 19, color: greenColor),
              Port(id: 20, color: redColor),
            ],
          ),
        ],
      ),
    );
  }
}

class Port extends StatelessWidget {
  final int id;
  final Color color;
  const Port({Key? key, required this.id, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          color: color,
        ),
        const SizedBox(height: 3),
        Text(id.toString())
      ],
    );
  }
}
