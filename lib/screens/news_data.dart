import 'package:flutter/material.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/widgets/articleItem.dart';

class NewsData extends StatelessWidget {

  String sourceId;

  NewsData({required this.sourceId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsData(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else {
            NewsResponse? data = snapshot.data;
            return ListView.builder(
              itemCount: data?.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return Articleitem(article: data?.articles?[index] ?? Articles());
              }         
            );
          }
        }
    );
  }
}
