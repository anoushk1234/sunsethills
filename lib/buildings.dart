import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class Building {
  final int height;
  final String index;
  final charts.Color barColor;

  Building(
      {@required this.height, @required this.index, @required this.barColor});
}
