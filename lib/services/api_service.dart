import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:newsapi_newsapp/models/article_model.dart';

class ApiService extends StatefulWidget {
  const ApiService({Key? key}) : super(key: key);

  @override
  _ApiServiceState createState() => _ApiServiceState();
}

class _ApiServiceState extends State<ApiService> {
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
    return Container();
  }
}
