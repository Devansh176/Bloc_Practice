// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:e_commerce/data/wishlist_items.dart';
// import 'package:e_commerce/features/home/models/home_product_dataModel.dart';
// import 'package:meta/meta.dart';
//
// part 'wishlist_event.dart';
// part 'wishlist_state.dart';
//
// class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
//   WishlistBloc() : super(WishlistInitial()) {
//     on<WishlistInitialEvent>(wishlistInitialEvent);
//     on<WishlistRemoveProductEvent>(wishlistRemoveProductEvent);
//   }
//
//   FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
//     print("Wishlist Initial Event");
//     emit(WishlistSuccessState(wishlistItems));
//   }
//
//   FutureOr<void> wishlistRemoveProductEvent(WishlistRemoveProductEvent event, Emitter<WishlistState> emit) {
//     print("item removed from Wishlist");
//     wishlistItems.remove(event.productDataModel);
//     emit(WishlistSuccessState(wishlistItems));
//   }
// }
