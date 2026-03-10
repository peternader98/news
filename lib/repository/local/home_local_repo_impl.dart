import 'package:injectable/injectable.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/repository/local/home_local_repo.dart';

@Injectable(as: HomeLocalRepo)
class HomeLocalRepoImpl implements HomeLocalRepo{
  @override
  Future<NewsResponse> getNewsData(String sourceId) async {
    return await CacheHelper.getNewsResponse(sourceId) ?? NewsResponse();
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    return await CacheHelper.getSourceResponse(categoryId) ?? SourcesResponse();
  }
}