import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  var news = <ArticleModel>[];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=bfa42c0c7f3c4a06928a3c629f3772cd';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          news.add(
            ArticleModel(
              article['title'],
              article['description'],
              article['url'],
              article['urlToImage'],
            ),
          );
        }
      });
    }
  }
}

class CategoryNewsClass {
  var categoryNews = <ArticleModel>[];

  Future<void> getCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=bfa42c0c7f3c4a06928a3c629f3772cd';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          categoryNews.add(
            ArticleModel(
              article['title'],
              article['description'],
              article['url'],
              article['urlToImage'],
            ),
          );
        }
      });
    }
  }
}
