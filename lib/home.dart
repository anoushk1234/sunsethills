import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunsethills/buildings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sunsethills/pages/chart_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int buildings = 0;
  int sunnybuildings = 0;
  List<int> heights = [];
  int _currentindex = 0;
  List<Building> society = [];
  List<int> sorted = [];

//List <int> sunnybuildings=[];
  //final TextEditingController _quantitiy = TextEditingController();

  ClipRRect _getBtmNavBar() {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          iconSize: 25,
          selectedFontSize: 15,
          backgroundColor: Colors.black,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
                //  backgroundColor: Colors.white,
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.home, color: Colors.white)),
            BottomNavigationBarItem(
                //   backgroundColor: Colors.black,
                title: Text("View", style: TextStyle(color: Colors.white)),
                icon: Icon(
                  Icons.insert_chart,
                  color: Colors.white,
                ))
          ],
          elevation: 15,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
            if (_currentindex == 1) {
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new ChartPage(soceity2: society),
              );
              Navigator.of(context).push(route);
            }
          },
        ));
  }

  Widget box() {
    return Container(
      height: 75,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 20, height: 20, //color: Colors.deepOrange,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 2))
                    ]),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Sunset viewable  ",
                  style: TextStyle(
                      fontFamily: "MuseoModerno",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 20, height: 20, //color: Colors.deepOrange,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 2))
                    ]),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  "Other buildings     ",
                  style: TextStyle(
                      fontFamily: "MuseoModerno",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Text(
        "Legend",
        style: TextStyle(
            fontFamily: "MuseoModerno",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      content: box(),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 349,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(223, 39, 17, 0.98),
                      Color.fromRGBO(245, 160, 25, 0.98)
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 291,
                          ),
                          Container(
                            width: 37.0,
                            height: 37.0,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage("assets/icon2.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(250.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "How many Buildings?",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontFamily: 'MuseoModerno',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 325,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText:
                                'Enter Number of Buildings and press enter',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (String n) {
                            setState(() {
                              buildings = 0;
                              buildings = int.parse(n);
                            });
                          },
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Enter the Heights",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontFamily: 'MuseoModerno',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 325,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Enter heights in eg:6,5,4... format',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (String n) {
                            setState(() {
                              heights.clear();
                              //String tempstr = "";
                              int k = -1;
                              int x = n.length;
                              for (var i = 0; i <= n.length - 1; i++) {
                                if (n[i] == ',') {
                                  heights.add(int.parse(n.substring(k + 1, i)));
                                  k = i;
                                } else if (i == x - 1) {
                                  heights.add(
                                      int.parse(n.substring(k + 1, i + 1)));
                                }
                              }
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: ButtonTheme(
                              height: 55,
                              minWidth: 65,
                              child: RaisedButton(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                child: new Text(
                                  "Initiate",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: "MuseoModerno",
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.black,
                                onPressed: () {
                                  /*var route = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      new BuildingChart(society: society,),
                                    );*/
                                  setState(() {
                                    society.clear();
                                    int temp = 0;
                                    sunnybuildings = 0;
                                    for (var i = 0; i < buildings; i++) {
                                      if (heights[i] > temp) {
                                        //sunnybuildings.add(heights[i]);
                                        society.add(Building(
                                            height: heights[i],
                                            index: (i + 1).toString(),
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.deepOrange)));
                                        temp = heights[i];
                                        sunnybuildings++;
                                      } else {
                                        society.add(Building(
                                            height: heights[i],
                                            index: (i + 1).toString(),
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.grey)));
                                        //  temp = heights[i];
                                      }
                                    }
                                  });
                                  int temp2 = 0;//print(sorted.toString()+"outside")
                                  sorted.clear();
                                  for(var i=0;i<buildings;i++){
                                    sorted.add(heights[i]);
                                   // print(sorted.toString()+"inside");
                                  }
                                  for(var i=0;i<buildings-1;i++){
                                    for(var j=0;j<buildings-1;j++){
                                      if(sorted[j]>sorted[j+1]){
                                        temp2=sorted[j];
                                        sorted[j]=sorted[j+1];
                                        sorted[j+1]=temp2;

                                      }
                                    }
                                  }
                                  print(sorted);

                                  var route = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new ChartPage(soceity2: society),
                                  );

                                  Navigator.of(context).push(route);
                                  showAlertDialog(context);
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1))
                      ]),
                  width: MediaQuery.of(context).size.width,
                  //height: 400,
                  //color: Color.fromRGBO(83, 224, 188, 1),
                  margin: EdgeInsets.all(10),
                  child: getData(sunnybuildings,sorted)),
            ],
          ),
        ),
        bottomNavigationBar: _getBtmNavBar());
  }
}

Widget getData(value,List <int>sorted) {
  bool canShow = false;
  int _value = value;
  if (_value != 0) {
    canShow = true;
    //print(canShow);
  }

  return Container(
      margin: EdgeInsets.all(33),
      child: canShow
          ? Column(children: [
              Text(
                "Number of Buildings able to see the sunset",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MuseoModerno"),
                textAlign: TextAlign.center,
              ),
              Container(
                  child: Text(
                "$_value",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MuseoModerno"),
                textAlign: TextAlign.center,
              )),
              Text(
                "Ideal Order for most buildings to see the sunset",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MuseoModerno"),
                textAlign: TextAlign.center,
              ),
              Container(
                  child: Text(
                "$sorted",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MuseoModerno"),
                textAlign: TextAlign.center,
              )),
            ])
          : Container());
}
