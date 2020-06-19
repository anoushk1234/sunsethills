import 'package:flutter/material.dart';
import 'package:sunsethills/building_chart.dart';
import 'package:sunsethills/buildings.dart';


class ChartPage extends StatelessWidget {
  final List<Building> soceity2;

  ChartPage({Key key, this.soceity2}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(1, 2))
                ]),
            //color: Colors.transparent,
            margin: EdgeInsets.all(20),
            child: Container(
              //margin: new EdgeInsets.symmetric(horizontal: 20.0),
              //color: Colors.white,
              margin: EdgeInsets.all(10),
              child: BuildingChart(soceity: soceity2),
            ),
          ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.black,),
    );
  }
}
