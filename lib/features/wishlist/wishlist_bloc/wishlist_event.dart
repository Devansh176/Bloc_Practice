part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveProductEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistRemoveProductEvent({required this.productDataModel});
}
