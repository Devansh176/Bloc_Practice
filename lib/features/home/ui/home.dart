import 'package:e_commerce/features/cart/ui/cartPage.dart';
import 'package:e_commerce/features/home/home_bloc/home_bloc.dart';
import 'package:e_commerce/features/home/ui/product_tileWidget.dart';
import 'package:e_commerce/features/wishlist/ui/wishlistPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    final double fontSize = width * 0.03;
    final double iconSize = width * 0.08;
    final double padding = width * 0.02;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartActionPage) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        }
        else if(state is HomeNavigateToWishlistActionPage) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishlistPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.lightGreen,
                ),
              ),
            );
            case HomeLoadedState:
              final successLoadedState = state as HomeLoadedState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen,
                title: Padding(
                  padding: EdgeInsets.only(left: padding * 1.5,),
                  child: Text("Market Mate",
                    style: TextStyle(
                      fontSize: fontSize * 2.2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: iconSize * 0.8,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: iconSize * 0.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: GridView.builder(
                  itemCount: successLoadedState.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successLoadedState.products[index], homeBloc: homeBloc,
                    );
                  },
                ),
              ),
            );
            case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error !!!'),
              ),
            );
            default:
            return Scaffold(
                body: Center(
                child: Text("Something went wrong"),
              ),
            );
        }
      },
    );
  }
}
