import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models & providers/products.dart';
import '/screens/product_detail_screen.dart';
import '/screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        home: ProductOverviewScreen(),
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            canvasColor: Colors.yellow.shade200,
            fontFamily: 'Lato'),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
