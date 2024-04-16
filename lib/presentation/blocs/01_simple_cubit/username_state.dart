part of 'username_cubit.dart';

sealed class UsernameState extends Equatable {
  const UsernameState();

  @override
  List<Object> get props => [];
}

final class UsernameInitial extends UsernameState {}
