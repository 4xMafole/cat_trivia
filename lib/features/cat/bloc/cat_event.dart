part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCatFactEvent extends CatEvent {}

class LoadCatImageEvent extends CatEvent {}

class LoadNextFactEvent extends CatEvent {}

class LoadFactHistoryEvent extends CatEvent {}
