import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/views/article_view.dart';
import 'package:newzin/views/categorie_news.dart';

Widget specialAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          translate('app_bar.title1'),
          style:
          TextStyle( fontWeight: FontWeight.w600),
        ),
        Text(
          translate('app_bar.title2'),
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    actions: <Widget>[
      Opacity(
        opacity: 0,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.share,color: Colors.transparent,)),
      )
    ],
    elevation: 0.0,
    centerTitle: true,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl;
  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.postUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: postUrl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 8,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Bahij',
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle( fontSize: 14),
                    textDirection: TextDirection.rtl,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
class PanelData extends StatelessWidget {
  final Color panelColor,textColor;
  final String panelTitle,count;
  final DecorationImage backImage;
  PanelData(
      {this.count, this.panelColor, this.panelTitle, this.textColor,this.backImage});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //getting the device width
    return Container(
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(25),color: panelColor,
        image: backImage,),
      margin: EdgeInsets.all(10),
      height: 100, width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            panelTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Bahij',
                color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Bahij',
                color: textColor),
          )
        ],
      ),
    );
  }
}
class CategoryCard extends StatefulWidget {
  final String imageAssetUrl, categoryName,function;
  CategoryCard({this.imageAssetUrl, this.categoryName,this.function});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: widget.function,)));},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Text(
                  widget.categoryName,
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
                image: NetworkImage(widget.imageAssetUrl))
          ),
        ),
      ),
    );
  }
}
class QuestionsWidget extends StatelessWidget {
  final String question, answer;
  QuestionsWidget({this.question, this.answer});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: Padding(
        padding: EdgeInsets.all(0),
        child: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Bahij',),)),
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(8),
            child: Text(answer,style: TextStyle(fontFamily: 'Bahij',),)
        ),
      ],
    );
  }
}
