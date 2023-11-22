import 'package:flutter/material.dart';
import '../models & providers/products.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // child aspect ratio is the ratio of width and height : width / height
        childAspectRatio: 3 / 3,
        // It is for column spacing
        crossAxisSpacing: 5,
        // It is for row spacing
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].imageUrl,
            // products[index].title,
            ),
      ),
      itemCount: products.length,
    );
  }
}
