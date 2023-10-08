class Cart {
  final String image;
  final String name;
  final String description;
  final double price;
  late int quantity;
  Cart(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.quantity});
}
