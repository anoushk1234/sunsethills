import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunsethills/home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(223, 39, 17, 0.98),
          Color.fromRGBO(245, 160, 25, 0.98)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text(
                    "SUNSET HILLS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.italic,
                      letterSpacing: 10,
                      fontFamily: 'MuseoModerno',
                    ),
                  ),
                  // Divider(height: 10,color:Colors.transparent),
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Container(
                width: 300.0,
                height: 280.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/icon2.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(250.0)),
                  border: new Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),

              ),
            )),
            Positioned(
              bottom: 30,
              left: 19,
              //width: MediaQuery.of(context).size.width*0.98,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(39)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 2))
                    ]),
                child: ButtonTheme(
                  child: RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Home(),
                          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    child: Text("Let's get started",
                        style: TextStyle(
                          fontSize: 25,
                          //fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontFamily: 'MuseoModerno',
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
