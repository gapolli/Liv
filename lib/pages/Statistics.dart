import 'package:flutter/material.dart';
import '../widgets/TextTitle.dart';
import '../widgets/StatisticsCard.dart';

/*
* https://google.github.io/charts/flutter/example/bar_charts/simple
* https://google.github.io/charts/flutter/gallery.html
*/

class Statistics extends StatelessWidget {
  Statistics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextTitle("Statistics"),
        StatisticsCard(),
        StatisticsCard(),
      ],
    );
  }
}