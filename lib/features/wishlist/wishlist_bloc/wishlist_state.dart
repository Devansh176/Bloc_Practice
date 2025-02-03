part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {
  final List<ProductDataModel> wishlistItems = [];
}

class WishlistSuccessState extends WishlistActionState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState(this.wishlistItems);
}