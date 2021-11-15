import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi_newsapp/models/article_model.dart';

class ArticleDetails extends StatelessWidget {
  final Article? article;

  const ArticleDetails({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            article!.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(article!.urlToImage),
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article!.source.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article!.content,
                style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article!.author,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
