part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  MainLoaded({required this.products});
  final Stream<List<Product>> products;
}

class MainFavUpdated extends MainState {}

class MainError extends MainState {
  MainError({required this.error});
  final String error;
}
