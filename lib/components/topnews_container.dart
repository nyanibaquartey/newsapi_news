import 'package:flutter/material.dart';
import 'package:newsapi_newsapp/models/article_model.dart';
import 'package:newsapi_newsapp/pages/article_details.dart';

class TopNewsContainer extends StatelessWidget {
  final Article? article;
  const TopNewsContainer({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetails(
                      article: article,
                    )));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article!.urlToImage),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0)),
          ),
          Text(
            article!.source.name.toUpperCase(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            article!.title,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

/*class TopNewsContainer extends StatefulWidget {
  const TopNewsContainer({
    Key? key, //this.article
  }) : super(key: key);

  // final Article? article;

  @override
  _TopNewsContainerState createState() => _TopNewsContainerState();
}

class _TopNewsContainerState extends State<TopNewsContainer> {
  Article? article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetails(
                      article: article,
                    )));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article!.urlToImage),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0)),
          ),
          Text(
            article!.source.name.toUpperCase(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            article!.title,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}*/

Widget topNewsContainer(BuildContext context, Article article) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetails(
                    article: article,
                  )));
    },
    child: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Text(
          article.source.name.toUpperCase(),
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          article.title,
          softWrap: true,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}
