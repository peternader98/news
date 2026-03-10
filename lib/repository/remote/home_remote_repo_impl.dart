import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/repository/remote/home_remote_repo.dart';

@Injectable(as: HomeRemoteRepo)
class HomeRemoteRepoImpl implements HomeRemoteRepo{

 ApiManager apiManager;

 HomeRemoteRepoImpl(this.apiManager);

  @override
  Future<NewsResponse> getNewsData(String sourceId) async {
    Response response = await apiManager.get('/v2/everything?sources=$sourceId');

    NewsResponse newsResponse = NewsResponse.fromJson(response.data);
    await CacheHelper.saveNewsResponse(newsResponse, sourceId);

    return newsResponse;

  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      Response response = await apiManager.get('/v2/top-headlines/sources?category=$categoryId');

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      await CacheHelper.saveSourceResponse(sourcesResponse, categoryId);

      return sourcesResponse;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
 }