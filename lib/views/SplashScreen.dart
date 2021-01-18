import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newzin/views/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    HomePage())));}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          children: <Widget>[
            Expanded(flex: 3,child: SizedBox(),),
            Expanded(
              flex: 6,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75.0),
                      child: Image.asset('images/newzin.png', width: 150.0,
                        height: 150.0, fit: BoxFit.fill,),),
                    decoration: new BoxDecoration(
                        boxShadow: [new BoxShadow(color: Colors.black87, blurRadius: 20.0,),],
                        borderRadius: BorderRadius.circular(78)),
                  ),
                ],
              ),
            ),
            Expanded(flex: 4,child: SizedBox(),),
            Expanded(flex: 1, child: Text("From",style: TextStyle(fontSize: 20,color: Colors.blue))),
            Expanded(flex: 1, child: Text("Mohamed Ghanem",style: TextStyle(fontSize: 16,color: Colors.grey))),
            Expanded(flex: 2,child: SizedBox(),),
          ],
        ),
      ),
    );
  }
}