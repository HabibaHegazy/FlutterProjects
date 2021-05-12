import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  // bool _showFavoritesOnly = false;

  List<Product> get products {
    // if (_showFavoritesOnly)
    //   return _products.where((productItem) => productItem.isFavorite).toList();
    return [..._products];
  }

  List<Product> get favoritesProducts {
    return _products.where((productItem) => productItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://my-shopp-app.herokuapp.com/products/1';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      // print(json.decode(response.body));
      final extractedObject = json.decode(response.body) as Map<String, Object>;
      final extractedData = extractedObject['data'] as List<dynamic>;
      List<Product> loadedProoducts = [];
      extractedData.forEach((data) {
        //print(data);
        loadedProoducts.add(Product(
          id: data['_id'],
          title: data['title'],
          description: data['description'],
          price: double.parse(data['price'].toString()),
          imageUrl: data['image'],
          // isFavorite: (data['isFavorite'].toLowerCase() == 'true'),
        ));
      });
      _products = loadedProoducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    // ProductService service = new ProductService(product);
    // service.saveToDatabase();
    const url = 'https://my-shopp-app.herokuapp.com/products/product';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'image': product.imageUrl,
          'price': product.price,
        }),
      );
      print(json.decode(response.body));
      final newProduct = Product(
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          id: json.decode(response.body)['id']);
      _products.add(newProduct);
      // _products.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final productIndex = _products.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      final url = 'https://my-shopp-app.herokuapp.com/products/product/$id';

      try {
        final response = await http.patch(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'image': newProduct.imageUrl,
            'price': newProduct.price,
            // 'isFavorite': newProduct.isFavorite
          }),
        );
        print(json.decode(response.body));
        _products[productIndex] = newProduct;
        notifyListeners();
      } catch (error) {
        print(error);
        throw error;
      }
    }
  }

  void deleteProduct(String id) async {
    final url = 'https://my-shopp-app.herokuapp.com/products/product/$id';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      print(json.decode(response.body));
    } catch (error) {
      print(error);
      throw error;
    }

    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
