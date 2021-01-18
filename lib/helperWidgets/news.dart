import 'package:http/http.dart' as http;
import 'package:newzin/models/article.dart';
import 'dart:convert';
class News {
  List<Article> news  = [];
  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=eg&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=d72f299d8eab4bff9a8f524e7dee432c";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
class NewsForCategory {
  List<Article> news  = [];
  Future<void> getNewsForCategory(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=d72f299d8eab4bff9a8f524e7dee432c";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}