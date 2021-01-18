import 'dart:convert';
import 'dart:ui';
import 'package:newzin/panels/mostAffectedPanel.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import 'package:newzin/panels/worldwideData.dart';
import 'package:http/http.dart' as http;
import 'package:newzin/panels/PanelInfo.dart';
import 'package:newzin/pages/countrystats.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_translate/flutter_translate.dart';
const String apiUrl = 'https://corona.lmao.ninja/v2';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  Map worldData;
  Future<dynamic> getWorldwideData() async {
    try {
      http.Response response = await http.get('$apiUrl/all');
      setState(() {
        worldData = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }
  List countryData;
  Future<dynamic> getMostAffectedCountries() async {
    try {
      http.Response response =
      await http.get('$apiUrl/countries?yesterday=false&sort=deaths');
      setState(() {
        countryData = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }
  Future<dynamic> combineFunctionAllData() async {
    getWorldwideData();
    getMostAffectedCountries();
  }
  @override
  void initState() {
    super.initState();
    combineFunctionAllData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate('covid.covid19tracker'),
          style: TextStyle(fontFamily: 'Bahij', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(

        onRefresh: combineFunctionAllData,
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff023750),
                      Colors.blue
                    ],
                  ),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                height: 120,
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
                  child: Text(
                    translate('covid.quote'),
                    style: TextStyle(
                      color: Color(0xfff9f9f9),
                      fontSize: 18,
                      fontFamily: 'Bahij',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      translate('covid.worldwide'),
                      style: customTextDecoration,
                    ),
                  ],
                ),
              ),
              SizedBox(height:5),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldwideData(
                data: worldData,
              ),
              SizedBox(height: 10),
              Text(
                translate('covid.most'),
                style: customTextDecoration,
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff023750), Colors.blue],
                  ),
                ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => CountryPage(),),);
                    },
                    child: Text(
                      translate('covid.regional'),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bahij'),
                    ),
                  ),
              ),
              SizedBox(height:15),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                countryData: countryData,
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: worldData==null ?Container(): PieChart(
                    chartLegendSpacing: 24,
                    chartValueStyle: TextStyle(fontFamily: 'Bahij',
                    ),
                    animationDuration: Duration(seconds: 10),
                    dataMap: {
                translate('covid.confirmed'): worldData['cases'].toDouble(),
                  translate('covid.active'): worldData['active'].toDouble(),
                  translate('covid.recovered'): worldData['recovered'].toDouble(),
                  translate('covid.death'): worldData['deaths'].toDouble(),
                },
                    colorList: [
                      Color(0xffff7675),
                      Color(0xff74b9ff),
                      Color(0xff55efc4),
                      Color(0xffb7b7b7),
                    ]
                ),
              ),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6)
                ),
                  child: Text(
                    translate('covid.lastupdate')+"\n${ DateTime.now()}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
              ),
              SizedBox(height: 30),
              PanelInfo(),
              SizedBox(height: 60),
              GestureDetector(
                onTap: (){
                  try{
                    launch('https://www.linkedin.com/in/momoghanem');
                  } catch (e){
                    print(e);
                  }
                },
                child: Text(
                  translate('covid.madewith'),
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Bahij',
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}