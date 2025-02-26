part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedState({required this.products});
}

final class HomeErrorState extends HomeState {}

final class HomeNavigateToWishlistActionPage extends HomeActionState{}

final class HomeNavigateToCartActionPage extends HomeActionState{}

class HomeProductItemWishListedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}