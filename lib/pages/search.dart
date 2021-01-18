import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Search extends SearchDelegate{  
  final List countryList ;
  Search({this.countryList});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => query='',) //query is already present inside the delegate
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
@override
  ThemeData appBarTheme(BuildContext context) {
    
    return  ThemeData(
      primaryColor:Color(0x88023750),
      brightness: Theme.of(context).brightness == Brightness.light ? Brightness.light:Brightness.dark
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final List  suggestionList = query.isEmpty ? countryList : countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index)=> Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        height: 140,
        decoration: Theme.of(context).brightness==Brightness.light ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[300],blurRadius: 2,offset:Offset(0, 15),),],
        ):BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[900],blurRadius: 2,offset:Offset(0, 15),),],) ,
       child: Row(
        children: <Widget>[
          Container( //container1
            margin: EdgeInsets.symmetric(vertical:10,horizontal:8),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(suggestionList[index]['country'].toString().toLowerCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Image.network((suggestionList[index]['countryInfo']['flag']),height: 50,width: 60,)
              ],
            ),
          ),
          Expanded(child: Container( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(translate('covid.confirmed') +" "+suggestionList[index]['cases'].toString(),style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij'),),
               Text(translate('covid.active')+" "+suggestionList[index]['active'].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij')),
                Text(translate('covid.recovered')+" "+suggestionList[index]['recovered'].toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij')),
                  Text(translate('covid.death')+" "+suggestionList[index]['deaths'].toString(),style: Theme.of(context).brightness==Brightness.light ?TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij'):TextStyle(color: Colors.grey.shade100,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Bahij')),
            ],
            ),
          ))
        ], 
      ),
        ),
    );
  }
}