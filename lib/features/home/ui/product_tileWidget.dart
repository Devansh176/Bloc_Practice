import 'package:e_commerce/features/home/home_bloc/home_bloc.dart';
import 'package:e_commerce/features/home/models/home_product_dataModel.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double fontSize = width * 0.035;
    final double padding = width * 0.02;

    return Container(
      margin: EdgeInsets.all(padding * 0.1),
      padding: EdgeInsets.all(padding * 2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(padding * 0.4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: width * 0.62,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(padding * 0.7),
              child: Image.network(
                productDataModel.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: padding * 2,),
          Text(
            productDataModel.title,
            style: TextStyle(
              fontSize: fontSize * 1.2,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: padding * 0.3),
          Text(
            productDataModel.description,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.grey[700],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: padding * 0.3),
          Row(
            children: [
              Text(
                "₹${productDataModel.price}",
                style: TextStyle(
                  fontSize: fontSize * 1.3,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[700],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductsWishlistButtonClickEvent());
                },
                icon: Icon(
                  Icons.favorite_border,
                  size: fontSize * 1.6,
                  color: Colors.green[700],
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductsCartButtonClickEvent());
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: fontSize * 1.6,
                  color: Colors.green[700],
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
