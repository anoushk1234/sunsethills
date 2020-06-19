import 'package:flutter/material.dart';
import 'package:sunsethills/home.dart';
import 'package:sunsethills/loading.dart';
import 'package:sunsethills/pages/chart_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    //'buildingchart':(context)  =>BuildingChart()
    'chart':(context) => ChartPage()
  },
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
));


