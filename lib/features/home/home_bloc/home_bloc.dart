import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/cart_items.dart';
import 'package:e_commerce/data/grocery_data.dart';
import 'package:e_commerce/data/wishlist_items.dart';
import 'package:e_commerce/features/home/models/home_product_dataModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductsWishlistButtonClickEvent>(homeProductsWishlistButtonClickEvent);
    on<HomeProductsCartButtonClickEvent>(homeProductsCartButtonClickEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event,
    Emitter<HomeState> emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 1),);
      emit(HomeLoadedState(products: GroceryData.groceryProducts.map((e) =>
        ProductDataModel(
          id: e['id'],
          title: e['name'],
          description: e['description'],
          price: e['price'],
          imageUrl: e['imageUrl'],
          )).toList()
        ),
      );
    }

  FutureOr<void> homeProductsWishlistButtonClickEvent(
    HomeProductsWishlistButtonClickEvent event, Emitter<HomeState> emit) {
      print("Wishlist Product Clicked");
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductsCartButtonClickEvent(
    HomeProductsCartButtonClickEvent event, Emitter<HomeState> emit) {
      print("Cart Product Clicked");
      cartItems.add(event.clickedProduct);
      emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
      print("Wishlist Navigate Clicked");
      emit(HomeNavigateToWishlistActionPage());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit) {
      print("Cart Navigate Clicked");
      emit(HomeNavigateToCartActionPage());
  }
}

