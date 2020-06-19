import 'package:flutter/material.dart';
import 'package:sunsethills/buildings.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BuildingChart extends StatelessWidget {
  final List<Building> soceity;

  BuildingChart({@required this.soceity});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Building, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: soceity,
          domainFn: (Building series, _) => series.index,
          measureFn: (Building series, _) => series.height,
          colorFn: (Building series, _) => series.barColor)
    ];
    return charts.BarChart(
      series,
      animate: true,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              minimumPaddingBetweenLabelsPx: 0,
              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  fontFamily: "MuseoModerno",
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.black))),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.black))),

    );
  }
}
