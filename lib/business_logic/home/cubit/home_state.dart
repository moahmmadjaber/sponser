part of 'home_cubit.dart';

@immutable
abstract class HomeState {}


class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeComplete extends HomeState {
}

class HomeError extends HomeState {
  final String err;
  HomeError(this.err);
}
