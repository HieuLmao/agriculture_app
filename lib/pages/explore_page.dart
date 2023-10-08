import 'package:agriculture_app/providers/product_provider.dart';
import 'package:agriculture_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<ProductsProvider>();
    final products = data.products;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            //search
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(IconlyLight.search),
                        hintText: 'Serach here...',
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(99)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(IconlyLight.filter),
                    ),
                  ),
                ],
              ),
            ),
            //consultation card
            SizedBox(
              child: Card(
                color: Colors.green.shade50,
                shadowColor: Colors.green.shade50,
                elevation: 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Free Consultation',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.green),
                            ),
                            const Text(
                              'Get free support from our customer services',
                            ),
                            FilledButton(
                              onPressed: () {},
                              child: const Text('Call now'),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/contact_us.png',
                        width: 140,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // featured
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See all'),
                  ),
                ],
              ),
            ),
            //featured product
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9),
                itemBuilder: (context, index) {
                  return ProductWidget(
                    product: products[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
