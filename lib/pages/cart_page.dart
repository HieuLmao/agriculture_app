import 'package:agriculture_app/providers/product_provider.dart';
import 'package:agriculture_app/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, value, child) => value.cartList.isEmpty
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.asset('assets/images/empty.gif'),
            )
          : ListView.builder(
              itemBuilder: (context, index) =>
                  CartItem(product: value.cartList[index]),
              itemCount: value.cartList.length,
            ),
    );
  }
}
