// import 'package:e_commerce/features/wishlist/wishlist_bloc/wishlist_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class WishlistPage extends StatefulWidget {
//   const WishlistPage({super.key});
//
//   @override
//   State<WishlistPage> createState() => _WishlistPageState();
// }
//
// class _WishlistPageState extends State<WishlistPage> {
//   final WishlistBloc wishlistBloc = WishlistBloc();
//
//   @override
//   void initState() {
//     super.initState();
//     wishlistBloc.add(WishlistInitialEvent());
//     print('WishlistInitialEvent added');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Wishlist"),
//         backgroundColor: Colors.lightGreen,
//       ),
//       body: BlocConsumer<WishlistBloc, WishlistState>(
//         bloc: wishlistBloc,
//         listener: (context, state) {
//         },
//         listenWhen: (previous, current) => current is WishlistActionState,
//         buildWhen: (previous, current) => current is !WishlistActionState,
//         builder: (context, state) {
//           switch(state.runtimeType) {
//             case WishlistSuccessState:
//               final successState = state as WishlistSuccessState;
//               return ListView.builder(
//                   itemCount: successState.wishlistItems.length,
//                   itemBuilder: (context, index) {
//                     final product = successState.wishlistItems[index];
//                     return ListTile(
//                       leading: Image.network(product.imageUrl),
//                       title: Text(product.title),
//                       subtitle: Text(product.price.toString()),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           wishlistBloc.add(WishlistRemoveProductEvent(productDataModel: product));
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("Product removed from Wishlist"),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }
//               );
//             default:
//               return Container();
//           }
//         },
//       ),
//     );
//   }
// }
