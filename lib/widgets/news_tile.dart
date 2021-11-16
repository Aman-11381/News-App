import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class NewsTile extends StatelessWidget {
  final imageUrl, title, description, url;

  NewsTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleView(
                    url: url,
                  ),
                ),
              );
            },
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 18.0,
            color: Colors.black26,
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
