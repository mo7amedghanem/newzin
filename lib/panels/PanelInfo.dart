import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/helperWidgets/Buttons.dart';
import 'package:newzin/pages/questionPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String donateURL = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate';
const String mythsURL = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters';
class PanelInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Buttons(
            name: translate('covid.aboutcovid'), function:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsPage(),),);},),
          Buttons(name: translate('covid.donate'), function: () {launch(donateURL);},),
          Buttons(name: translate('covid.myth'), function: () {launch(mythsURL);},),
        ],
      ),
    );
  }
}