part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatFactLoaded extends CatState {
  CatFactLoaded(this.fact);
  final CatFact fact;

  @override
  List<Object> get props => [fact];
}

class CatImageLoaded extends CatState {
  CatImageLoaded(this.image);
  final CatImage image;

  @override
  List<Object> get props => [image];
}

class CatFactHistoryLoaded extends CatState {
  CatFactHistoryLoaded(this.history);
  final List<CatFact> history;

  @override
  List<Object> get props => [history];
}

class CatError extends CatState {
  CatError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
