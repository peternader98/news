import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String categoryId);
  Future<NewsResponse> getNewsData(String sourceId);
}