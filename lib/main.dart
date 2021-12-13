import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi_newsapp/components/custom_list_tile.dart';
import 'package:newsapi_newsapp/models/article_model.dart';
import 'package:newsapi_newsapp/components/topnews_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Article> articlesList = [];

  @override
  void initState() {
    fetchArticle();
    super.initState();
  }

  void fetchArticle() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?language=en&country=us&category=general&apiKey=dacfaaafc042464395e3433b725b2ca2'),
      //Send authorization headers to the backend.
      //headers: {
      // HttpHeaders.authorizationHeader: 'dacfaaafc042464395e3433b725b2ca2',
      // },
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    // print(body);
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    // print(articles);
    //return articles;
    setState(() {
      articlesList = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Article? article;

    return MaterialApp(
      title: 'NEWS APP',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'NEWS FEED',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
           // const TopNewsContainer(),
            // topNewsContainer(context, article!),
            //const SizedBox(
              //height: 8.0,
            //),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articlesList.length,
                itemBuilder: (context, index) =>
                    customListTile(context, articlesList[index])),
          ],
        ),
      ),
    );
  }
}
