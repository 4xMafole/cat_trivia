import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_fact_client/cat_fact_client.dart';
import 'package:cat_fact_repository/cat_fact_repository.dart';
import 'package:cat_image_client/cat_image_client.dart';
import 'package:equatable/equatable.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc(this._repository) : super(CatInitial()) {
    on<LoadCatFactEvent>(_onLoadCatFactEventRequested);
    on<LoadCatImageEvent>(_onLoadCatImageEventRequested);
    on<LoadNextFactEvent>(_onLoadNextFactEventRequested);
    on<LoadFactHistoryEvent>(_onLoadFactHistoryEventRequested);
  }
  final CatFactRepositoryImpl _repository;

  Future<void> _onLoadCatFactEventRequested(
    LoadCatFactEvent event,
    Emitter<CatState> emit,
  ) async {
    try {
      final fact = await _repository.getRandomFact();
      emit(CatFactLoaded(fact));
    } catch (_) {
      emit(CatError('Failed to load cat fact'));
    }
  }

  Future<void> _onLoadCatImageEventRequested(
    LoadCatImageEvent event,
    Emitter<CatState> emit,
  ) async {
    try {
      final image = await _repository.getRandomImage();
      emit(CatImageLoaded(image));
    } catch (_) {
      emit(CatError('Failed to load cat image'));
    }
  }

  Future<void> _onLoadNextFactEventRequested(
    LoadNextFactEvent event,
    Emitter<CatState> emit,
  ) async {
    try {
      final fact = await _repository.getNextFact();
      emit(CatFactLoaded(fact));
    } catch (e) {
      print(e);
      emit(CatError('Failed to load next cat fact'));
    }
  }

  Future<void> _onLoadFactHistoryEventRequested(
    LoadFactHistoryEvent event,
    Emitter<CatState> emit,
  ) async {
    try {
      final history = await _repository.getFactHistory();
      emit(CatFactHistoryLoaded(history));
    } catch (_) {
      emit(CatError('Failed to load fact history'));
    }
  }
}
