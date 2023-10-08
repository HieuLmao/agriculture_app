import 'package:agriculture_app/data/products.dart';
import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/providers/product_provider.dart';
import 'package:agriculture_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  static String routesName = 'productDetailPage';
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 0;
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final response = context.read<ProductsProvider>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text(
            'Details',
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(IconlyBroken.bookmark))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.product.image),
                ),
              ),
            ),
            Text(
              widget.product.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available in stock',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${widget.product.price}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: '/${widget.product.unit}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade800,
                    ),
                    Text('${widget.product.rating} (192)'),
                  ],
                ),
                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        decrementQuantity();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text(
                        '$quantity ${widget.product.unit}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        incrementQuantity();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sx,
            ),
            //description
            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(widget.product.description),
            SizedBox(
              height: sx,
            ),
            //relate products
            Text(
              'Relate Products',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: small,
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: sx),
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(products[index].image),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: medium),
            FilledButton.icon(
              onPressed: () {
                response.addCartItem(widget.product);
              },
              icon: const Icon(IconlyLight.bag_2),
              label: const Text('Add to cart'),
            ),
          ],
        ));
  }
}
