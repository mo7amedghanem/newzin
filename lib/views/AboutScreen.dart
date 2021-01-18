import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/helperWidgets/Buttons.dart';
import 'package:newzin/helperWidgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

const customTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Bahij');

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: specialAppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:4),
            child: Column(
              children: <Widget>[
                Text(
                  translate('aboutApp.label'),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: 'Bahij',
                  fontSize: 18,fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    translate('aboutApp.description'),
                    style: TextStyle(fontFamily: 'Bahij',
                        fontSize: 18),
                  ),
                ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.asset(
                              'images/momo.jpg', fit: BoxFit.fill,
                              height: 150, width: 150,),
                            borderRadius: BorderRadius.circular(75),),
                          Text(
                             translate('aboutApp.name'),
                            style: TextStyle(fontFamily: 'Bahij',
                                fontSize: 16,fontWeight: FontWeight.bold)),
                          Text(
                            translate('aboutApp.jop'),
                            style: customTextStyle,),
                          Text(
                            '22',
                            style: customTextStyle,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              ProfileIcons(
                                url: 'images/linkedin.png',
                                function: (){
                                  try{
                                    launch('https://www.linkedin.com/in/momoghanem');
                                  } catch (e){
                                    print(e);}},
                              ),
                              SizedBox(width: 16,),
                              ProfileIcons(
                                url: 'images/facebook.png',
                                function: (){
                                  try{
                                    launch('https://www.facebook.com/mohamedghanem60');
                                  } catch (e){
                                    print(e);}},
                              ),
                            ],
                            ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
