import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/repository/local/home_local_repo.dart';
import 'package:news/repository/remote/home_remote_repo.dart';
import 'package:news/screens/bloc/states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeRemoteRepo remoteRepo;
  HomeLocalRepo localRepo;

  HomeCubit(this.remoteRepo, this.localRepo) : super(HomeInit());

  static HomeCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<Sources> sources = [];
  List<Articles> articles = [];

  onTabChanged(int index) {
    selectedIndex = index;
    emit(HomeOnTabChanged());
    getNewsData(sources[selectedIndex].id ?? '');
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoadingState());
    try {
      SourcesResponse sourcesResponse = InternetConnectivity().isConnected
          ? await remoteRepo.getSources(categoryId)
          : await localRepo.getSources(categoryId);

      sources = sourcesResponse.sources ?? [];

      emit(GetSourcesSuccessState());
      getNewsData(sources[selectedIndex].id ?? '');
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  Future<void> getNewsData(String sourceId) async {
    emit(GetNewsLoadingState());
    try {
      NewsResponse newsResponse = InternetConnectivity().isConnected
          ? await remoteRepo.getNewsData(sourceId)
          : await localRepo.getNewsData(sourceId);

      articles = newsResponse.articles ?? [];

      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState());
    }
  }
}
