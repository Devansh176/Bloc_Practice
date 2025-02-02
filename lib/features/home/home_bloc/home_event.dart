part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductsWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductsWishlistButtonClickEvent({required this.clickedProduct});
}

class HomeProductsCartButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductsCartButtonClickEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}