import 'package:hive/hive.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

class CacheHelper {
  static const String _sourceBox = 'SourcesBox';
  static const String _newsBox = 'NewsBox';

  static Future<Box> _openSourcesBox() async {
    if(!Hive.isBoxOpen(_sourceBox)) {
      return await Hive.openBox<SourcesResponse>(_sourceBox);
    }

    return Hive.box<SourcesResponse>(_sourceBox);
  }

  static Future<void> saveSourceResponse(SourcesResponse sourcesResponse, String categoryId) async {
    final box = await _openSourcesBox();
    await box.put('sources-$categoryId', sourcesResponse);
  }

  static Future<SourcesResponse?> getSourceResponse(String categoryId) async {
    final box = await _openSourcesBox();
    return box.get('sources-$categoryId');
  }

  static Future<Box> _openNewsBox() async {
    if(!Hive.isBoxOpen(_newsBox)) {
      return await Hive.openBox<NewsResponse>(_newsBox);
    }

    return Hive.box<NewsResponse>(_newsBox);
  }

  static Future<void> saveNewsResponse(NewsResponse newsResponse, String categoryId) async {
    final box = await _openNewsBox();
    await box.put('News-$categoryId', newsResponse);
  }

  static Future<NewsResponse?> getNewsResponse(String categoryId) async {
    final box = await _openNewsBox();
    return box.get('News-$categoryId');
  }
}