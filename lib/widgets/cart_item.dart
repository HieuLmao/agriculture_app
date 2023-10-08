import 'package:agriculture_app/data/products.dart';
import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/providers/product_provider.dart';
import 'package:agriculture_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final response = context.read<ProductsProvider>();
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          response.removeCartItem(widget.product);
        });
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sx),
          color: Colors.red,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: small),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: whiteColor,
            ),
          ),
        ),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(sx),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            elevation: 0.4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: small),
                    height: double.infinity,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sx),
                      image: DecorationImage(
                          image: AssetImage(
                            widget.product.image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          widget.product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Text(
                          '\$${widget.product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
