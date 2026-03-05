import 'package:dio/dio.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/repository/home_repo.dart';

class HomeRemoteRepo implements HomeRepo{

  static final dio = Dio();

  @override
  Future<NewsResponse> getNewsData(String sourceId) async {
    Response response = await dio.get('/v2/everything?sources=$sourceId');

    return NewsResponse.fromJson(response.data);
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      Response response = await dio.get('/v2/top-headlines/sources?category=$categoryId');

      return SourcesResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
 }