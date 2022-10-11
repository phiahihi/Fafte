part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainEventFetch extends MainEvent {}

class MainEventFavourite extends MainEvent {
  MainEventFavourite({
    required this.id,
    required this.isFavourite,
    required this.notifyUpdateIsFavourite,
    required this.context,
  });
  final String id;
  final bool isFavourite;
  final VoidCallback notifyUpdateIsFavourite;
  final BuildContext context;
}
