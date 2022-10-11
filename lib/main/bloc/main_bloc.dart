import 'dart:async';

import 'package:bloc/bloc.dart';
import '../data/models/product.dart';
import '../data/repository/main_repository.dart';
import '../data/repository/main_repository.dart';
import '/data/sharedprefs/shared_preference_helper.dart';
import '/main/data/models/product.dart';
import '/main/data/repository/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this.mainRepository) : super(MainInitial()) {
    on<MainEventFetch>(_fetchMainProducts);
    on<MainEventFavourite>(_updateFavouriteStatusOfProduct);
  }
  final MainRepository mainRepository;

  Future<void> _fetchMainProducts(
    MainEventFetch event,
    Emitter<MainState> emit,
  ) async {
    try {
      emit(MainLoading());
      final data = mainRepository.products;
      emit(MainLoaded(products: data));
    } catch (e) {
      emit(MainError(error: e.toString()));
    }
  }

  Future<void> _updateFavouriteStatusOfProduct(
    MainEventFavourite event,
    Emitter<MainState> emit,
  ) async {
    try {
      await mainRepository
          .updateFavourite(
        event.id,
        event.context,
        isFavourite: event.isFavourite,
      )
          .then((value) {
        event.notifyUpdateIsFavourite();
      });
    } catch (e) {
      emit(MainError(error: e.toString()));
    }
  }
}
