import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import '../screens/edit_product_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import '../providers/orders.dart';

void main() => runApp(MyApp());

/*
  ChangeNotifierProvider vs ChangeNotifierProvider.value if use provider on aa part of aa list better to use                  ( ChangeNotifierProvider.value ) => you make sure that that provider works even if data changes in the widget. ChangeNotifierProvider => will provide error when list exeeds the screen bounders.

  Here it is recommended to use => ChangeNotifierProvider => because it is created whenever we crate a new instance.
  existing object => ChangeNotifierProvider.value
  ------------------------------------------------------------
  flutter automatically cleans all the widgets built,
  proveded data wont be cleaned automatically, this will cause that every time you open that screen more data stoored in memory that leads to memory leak.

  ChangeNotifierProvider => either with value or not this will auto clean your data.
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
