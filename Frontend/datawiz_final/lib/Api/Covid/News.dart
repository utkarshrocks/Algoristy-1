import 'dart:convert';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:http/http.dart' as http;
import 'package:datawiz_final/Models/CovidModels/Article.dart';

class getnews{
  Future<bool> all_news() async {

    articles.clear();

    String country = data.Country.substring(0,2).toLowerCase();
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$country&language=en&pageSize=100&category=${data.Category.toLowerCase()}&apiKey=${data.Key}"),
      headers: {'key': '${data.Key}'},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
    return true;
  }

  Future<bool> querry_news(String q) async {
    articles.clear();

    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=$q&language=en&sortBy=${data.sortby}&apiKey=${data.Key}"),
      headers: {'key': '${data.Key}'},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
    return true;
  }

  Future<bool> channel_news() async {
    articles.clear();

    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?domains=${data.channel}&language=en&apiKey=${data.Key}"),
      headers: {'key': '${data.Key}',},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
    return true;
  }

}