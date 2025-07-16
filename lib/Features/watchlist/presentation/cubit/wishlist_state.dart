import 'package:equatable/equatable.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<MoviesEntity> watchlist;

  const WatchlistLoaded(this.watchlist);

  @override
  List<Object?> get props => [watchlist];
}

class WatchlistError extends WatchlistState {
  final String message;

  const WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}
