
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<String> {
  //* Estado inicial
  UsernameCubit() : super('no-username');

  void setUsername(String username) {
    emit(username);
  }
}
