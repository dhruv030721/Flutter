import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red T-Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://imgs7.luluandsky.com/catalog/product/8/9/89Z-88009-RED_1.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://img.tatacliq.com/images/i8/437Wx649H/MP000000015514535_437Wx649H_202212010344281.jpeg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://lemonwood.ca/cdn/shop/products/Lemonwood_-_Cashmere_Scarf_-_Neon_Yellow_2048x2048.jpg?v=1689012772',
    ),
    Product(
      id: 'p4',
      title: 'Nike Jordan',
      description: 'Give your total outfit unique look by wearing nike jordan.',
      price: 49.99,
      imageUrl:
          'https://dropoutmilano.com/cdn/shop/files/jordan-1-low-panda-2023-women-s-dropout-1_af27c88b-08e6-47f1-a522-5943cd3d0165_700x700.jpg?v=1690036946',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
