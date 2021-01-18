import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/helperWidgets/widgets.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 80,
      child: Swiper.children(
                  children: <Widget>[
                   CategoryCard(
                     imageAssetUrl: "https://image.freepik.com/free-photo/handshake-businessmen_1098-742.jpg",
                     categoryName:translate('category.business'),
                     function: 'business',),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-photo/people-s-emotions-cinema_155003-8907.jpg",
                      categoryName:translate('category.entertainment'),
                      function: 'entertainment'),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-psd/man-reading-news-breakfast-table_53876-57301.jpg",
                      categoryName:translate('category.general'),
                      function: 'general'),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-photo/girl-granola-honey-blue-white-natural_1428-679.jpg",
                      categoryName:translate('category.health'),
                      function: 'health'),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-photo/team-little-chemists_1098-16788.jpg",
                      categoryName:translate('category.science'),
                      function: 'science'),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-photo/soccer-into-goal-success-concept_1150-5273.jpg",
                      categoryName:translate('category.sports'),
                      function: 'sports',),
                    CategoryCard(
                      imageAssetUrl: "https://image.freepik.com/free-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg",
                      categoryName:translate('category.technology'),
                      function: 'technology',),
                  ],
                   viewportFraction: 0.8,
                  scale: 0.9,
        pagination: SwiperPagination(alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                color: Color(0xfff9f9f9),activeColor: Colors.blue
            )
        ),
        control:  SwiperControl(color: Colors.blue),),
    );
  }
}