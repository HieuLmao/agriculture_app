import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/styles.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
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
                            product.image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
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
