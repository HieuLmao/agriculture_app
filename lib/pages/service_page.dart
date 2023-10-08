import 'dart:ui';

import 'package:agriculture_app/providers/product_provider.dart';
import 'package:agriculture_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<ProductsProvider>();
    final services = data.services;
    return GridView.builder(
      padding: EdgeInsets.all(sx),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(small),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(services[index].image),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(small),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Text(
                services[index].name,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
