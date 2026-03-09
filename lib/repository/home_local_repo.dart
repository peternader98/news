import 'package:injectable/injectable.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/repository/home_repo.dart';

@Named('local')
@Injectable(as: HomeRepo)
class HomeLocalRepo implements HomeRepo{
  @override
  Future<NewsResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}