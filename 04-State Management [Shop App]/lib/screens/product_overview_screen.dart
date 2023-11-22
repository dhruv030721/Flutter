import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        elevation: 10,
        title: Image.asset(
          'assets/images/logo.png',
          width: 180,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: ProductGrid(),
    );
  }
}
