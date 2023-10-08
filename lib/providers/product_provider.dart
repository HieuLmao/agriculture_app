import 'package:agriculture_app/models/cart.dart';
import 'package:agriculture_app/models/service.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Service> _services = [
    Service(
      name: "Seeds",
      image: "assets/services/seeds.jpg",
    ),
    Service(
      name: "Seedlings",
      image: "assets/services/seedlings.jpg",
    ),
    Service(
      name: "Machinery",
      image: "assets/services/machinery.jpg",
    ),
    Service(
      name: "Hire Worker",
      image: "assets/services/workers.jpg",
    ),
    Service(
      name: "Cultivation process",
      image: "assets/services/cultivation.jpg",
    ),
    Service(
      name: "Crop disease solution",
      image: "assets/services/crop_disease.jpg",
    ),
  ];

  final List<Product> _products = [
    Product(
      name: "Tractor",
      description:
          "Exence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
      image: 'assets/images/tractor.jpg',
      price: 377.00,
      unit: 'day(s)',
      rating: 4.35,
    ),
    Product(
      name: "Fresh Fruits",
      description:
          "Indulge in the natural sweetness and goodness of our handpicked assortment of fresh fruits. Bursting with flavors and packed with nutrients, these delectable treats are ect for snacking, cooking, or adding a vibrant touch to your meals.",
      image: 'assets/images/fruit.jpg',
      price: 9.99,
      unit: 'kg',
      rating: 3.86,
    ),
    Product(
      name: "Gardener's Rake",
      description:
          "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
      image: 'assets/images/rake.jpg',
      price: 8.44,
      unit: 'piece',
      rating: 4.18,
    ),
    Product(
      name: "Premium Seeds",
      description:
          "Embark on a journey of cultivation with our premium seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
      image: 'assets/images/seeds.jpg',
      price: 14.52,
      unit: 'kg',
      rating: 5.0,
    ),
    Product(
      name: "Sturdy Shovel",
      description:
          "Conquer your landscaping and gardening tasks with our durable and versatile shovel. Built to withstand demanding work, its ergonomic handle and robust blade make digging, lifting, and moving materials a breeze. Elevate your outdoor projects with this essential tool.",
      image: 'assets/images/shovel.jpg',
      price: 14.77,
      unit: 'piece',
      rating: 5.0,
    ),
    Product(
      name: "Juicy Tomatoes",
      description:
          "Add a pop of color and flavor to your dishes with our juicy tomatoes. Grown with care, these plump and succulent tomatoes are a kitchen staple. Whether you're making sauces, salads, or sandwiches, these tomatoes are the key to culinary delight.",
      image: 'assets/images/tomato.jpg',
      price: 6.84,
      unit: 'kg',
      rating: 3.22,
    ),
  ];

  final List<Product> _cartList = [];
  List get services => _services;
  List get products => _products;
  List get cartList => _cartList;

  void addCartItem(Product product) {
    _cartList.add(product);
    notifyListeners();
  }

  void removeCartItem(Product product) {
    _cartList.remove(product);
    notifyListeners();
  }
  //add cartItem
}
