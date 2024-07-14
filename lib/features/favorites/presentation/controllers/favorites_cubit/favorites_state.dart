part of 'favorites_cubit.dart';

sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesFailure extends FavoritesState {
  final Failure failure;

  const FavoritesFailure({required this.failure});
}

final class FavoritesSuccess extends FavoritesState {}
