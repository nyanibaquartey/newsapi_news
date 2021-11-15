//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapi_newsapp/pages/article_details.dart';
import 'package:newsapi_newsapp/models/article_model.dart';

Widget customListTile(BuildContext context, Article article) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleDetails(
            article: article,
          ),
        ),
      );
    },
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        //border: Border(
        //bottom: BorderSide(width: 0.0, color: Colors.grey),
        //),
      ),
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Container(
                //padding: EdgeInsets.all(8.0),
                //decoration: BoxDecoration(
                //  color: Colors.red, borderRadius: BorderRadius.circular(25)),
                // child:
                Row(
                  children: [
                    Text(
                      article.source.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(article.publishedAt.substring(11, 16),
                        style: const TextStyle(color: Colors.grey)
                        //softWrap: true,
                        ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.deepOrange,
                      size: 20.0,
                    ),
                  ],
                ),
                // ),
                const SizedBox(height: 10.0),
                Text(
                  article.title,
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  article.source.name,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      FontAwesomeIcons.ellipsisH,
                      size: 20.0,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 100.0,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
