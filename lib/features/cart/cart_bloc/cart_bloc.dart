import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/cart_items.dart';
import 'package:e_commerce/features/home/models/home_product_dataModel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductRemoveEvent>(cartProductRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
      emit(CartSuccessState(cartItems));
  }

  FutureOr<void> cartProductRemoveEvent(CartProductRemoveEvent event, Emitter<CartState> emit) {
      cartItems.remove(event.productDataModel);
      emit(CartSuccessState(cartItems));
  }
}

