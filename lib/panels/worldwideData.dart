import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/helperWidgets/widgets.dart';

class WorldwideData extends StatelessWidget {
  final Map data;
  WorldwideData({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true, //to avoid grid view to expand all the size
        physics: NeverScrollableScrollPhysics(), //to not let it scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                2 //height is double the width a good rectangel here) ,
            ),
        children: <Widget>[
          PanelData(
              panelTitle:translate('covid.confirmed'),
              panelColor: Colors.red.shade100,
              textColor: Colors.red.shade700,
              count: data['cases'].toString(),
               backImage: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2020/11/23/18/31/child-5770618_960_720.jpg'),
              colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.40), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
          PanelData(
            panelTitle:translate('covid.active'),
              panelColor: Colors.blue.shade100,
              textColor: Colors.blue.shade900,
              count: data['active'].toString(),
            backImage: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2020/03/30/09/11/corona-4983566_960_720.jpg'),
              colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),),
          PanelData(
            panelTitle:translate('covid.recovered'),
              panelColor: Colors.green.shade100,
              textColor: Colors.green.shade700,
              count: data['recovered'].toString(),
            backImage: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2020/04/21/16/39/covid-19-5073808_960_720.jpg'),
              colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
          PanelData(
            panelTitle:translate('covid.death'),
              panelColor: Colors.grey.shade400,
              textColor: Colors.grey.shade700,
              count: data['deaths'].toString(),
            backImage: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2020/04/19/14/52/corona-5063998_960_720.png'),
              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
        ],
      ),
    );
  }
}