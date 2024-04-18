import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode = false,
  }) : super(ThemeState(isDarkMode: darkMode));


  void toggledTheme(){
    emit(ThemeState(isDarkMode: !state.isDarkMode));
    print(state.isDarkMode);
  }

  void setDarkMode(){
     emit(const ThemeState(isDarkMode: true));
  }
    void setLigthMode(){
     emit(const ThemeState(isDarkMode: false));
  }
}
