import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/theme/base_theme.dart';
import 'package:news/core/theme/bloc/states.dart';
import 'package:news/core/theme/dark_theme.dart';
import 'package:news/core/theme/light_theme.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  BaseTheme theme = LightTheme();

  String themeLable = 'light';

  changeTheme() {
    if (theme is LightTheme) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    emit(ThemeChangedState());
  }
}
