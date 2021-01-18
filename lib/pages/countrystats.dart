import 'package:flutter_translate/global.dart';
import 'package:newzin/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = 'https://disease.sh/v2';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}
class _CountryPageState extends State<CountryPage> {
  List countryData;
  Future<dynamic> getMostAffectedCountries() async {
    try {
      http.Response response =
          await http.get('$apiUrl/countries?yesterday=false&sort=cases');
      setState(() {
        countryData = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }
@override
  void initState() {
    getMostAffectedCountries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),color: Colors.white,
          disabledColor: Colors.white, onPressed: (){
            countryData == null ? CircularProgressIndicator(semanticsLabel: 'Please wait',):
            showSearch(context: context, delegate:Search(countryList: countryData),);
          }),
        ],
        title: Text(
          translate('covid.cases'),
          style: TextStyle(fontFamily: 'Bahij', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: countryData==null ? Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: countryData == null? 0 :countryData.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      height: 140,
      decoration: Theme.of(context).brightness==Brightness.light ? BoxDecoration( 
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[300],blurRadius: 2,offset:Offset(0, 15),),],
      ):BoxDecoration( 
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[900],blurRadius: 2,offset:Offset(0, 15),),],
      ) ,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical:10,horizontal:25),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Image.network((countryData[index]['countryInfo']['flag']),height: 50,width: 60,)
              ],
            ),
          ),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(translate('covid.confirmed') +" "+countryData[index]['cases'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij',),),
               Text(translate('covid.active')+" "+countryData[index]['active'].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij',)),
                Text(translate('covid.recovered')+" "+countryData[index]['recovered'].toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij',)),
                  Text(translate('covid.death')+" "+countryData[index]['deaths'].toString(),style: Theme.of(context).brightness==Brightness.light ?TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij',):TextStyle(color: Colors.grey.shade100,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij',)),
            ],
            ),
          ),)
        ], 
      ),
        ),
      ),
    );
  }
}
