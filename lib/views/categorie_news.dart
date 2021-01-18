import 'package:flutter/material.dart';
import 'package:newzin/helperWidgets/news.dart';
import 'package:newzin/helperWidgets/widgets.dart';
class CategoryNews extends StatefulWidget {
  final String newsCategory;
  CategoryNews({this.newsCategory});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}
class _CategoryNewsState extends State<CategoryNews> {
  var newsList;
  bool _loading = true;
  @override
  void initState() {
    getNews();
    super.initState();
  }
  void getNews() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: specialAppBar(),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount: newsList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsTile(
                      imgUrl: newsList[index].urlToImage ?? "",
                      title: newsList[index].title  ?? "",
                      desc: newsList[index].description ?? "",
                      content: newsList[index].content ?? "",
                      postUrl: newsList[index].articleUrl ?? "",
                    );
                  }),
            ),
        ),
      ),
    );
  }
}