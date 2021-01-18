import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  MostAffectedPanel({this.countryData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context,index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(countryData[index]['countryInfo']['flag'],height: 24,),
            SizedBox(width:6),
            Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(width:6),
            Text( translate('covid.death')+countryData[index]['deaths'].toString(),
              style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontFamily: 'Bahij'),),//0.country0.deaths
          ],
        ),
      ),
      ),
    );
  }
}