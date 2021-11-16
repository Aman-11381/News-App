import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final category;

  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var articles = <ArticleModel>[];

  bool _loading = true;

  void getArticles() async {
    CategoryNewsClass newsObject = CategoryNewsClass();
    await newsObject.getCategoryNews(widget.category);
    articles = newsObject.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ///News Articles
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return NewsTile(
                            title: articles[index].title,
                            imageUrl: articles[index].urlToImage,
                            description: articles[index].description,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
