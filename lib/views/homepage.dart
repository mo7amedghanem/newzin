import 'dart:ui';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newzin/helperWidgets/Buttons.dart';
import 'package:newzin/views/AboutScreen.dart';
import 'package:newzin/views/CovidPage.dart';
import 'package:newzin/views/Profile.dart';
import 'package:newzin/views/categories.dart';
import 'package:newzin/views/translation.dart';
import 'package:newzin/const.dart';
import 'package:newzin/helperWidgets/widgets.dart';
import '../helperWidgets/news.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newsList;
  bool isToggled = false ;

  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: specialAppBar(),
      drawer: Drawer(
        elevation: 22.0,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 32,),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),),);},

                child: ClipRRect(
                  child: Image.asset(
                    'images/momo.jpg', fit: BoxFit.fill,
                    height: 150, width: 150,),
                  borderRadius: BorderRadius.circular(75),),
              ),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: ()  => onActionSheetPress(context),
                child: drawerButton(TextDecoration, translate('category.language')
                    ,Text(translate('category.choosed'),style: TextDecoration,),widget2:SizedBox()),
              ),
              drawerButton(TextDecoration, translate('category.mode'),FlutterSwitch(
                height: 25.0, width: 50.0, padding: 4.0, toggleSize: 20.0,
                borderRadius: 20.0, activeColor: Colors.indigo[900], value: isToggled,
                onToggle: (value) {
                  setState(() {
                    isToggled = value ;
                    DynamicTheme.of(context).setBrightness(
                        Theme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light);});},),widget2: Text(""),),
              drawerButton(TextDecoration, translate('category.version')
                  ,Text(translate('category.code'),style: TextDecoration,),widget2:SizedBox()),
              GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen(),),);},
                  child: drawerButton(TextDecoration, translate('category.about'),SizedBox(),widget2:  Text(''),)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    children: <Widget>[
                      Container(margin:EdgeInsets.symmetric(horizontal: 0),child: MyHomePage()),
                      SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CovidPage(),),);},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black26),
                                    child: Text(
                                      translate('category.covid19tracker'),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: 'Bahij',
                                          color: Color(0xfff9f9f9), fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.fitWidth,
                                      image: NetworkImage("https://cdn.pixabay.com/photo/2020/04/03/19/02/virus-4999857_960_720.png"
                                      ))
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 380,
                        child: Swiper(
                          autoplay: true,
                            autoplayDelay: 8000,
                            itemCount: newsList.length,
                            viewportFraction: 0.8,
                            autoplayDisableOnInteraction: true,
                            pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.grey,activeColor: Colors.blue
                              )
                            ),
                            scale: 0.9,
                            control:  SwiperControl(
                              color: Colors.blue
                            ),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newsList[index].urlToImage ?? "",
                                title: newsList[index].title ?? "",
                                desc: newsList[index].description ?? "",
                                content: newsList[index].content ?? "",
                                postUrl: newsList[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}