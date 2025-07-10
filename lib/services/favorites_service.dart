import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService with ChangeNotifier {
  List<Product> _favoriteProducts = [];
  static const String _favoritesKey = 'favoriteProducts';

  List<Product> get favoriteProducts => List.unmodifiable(_favoriteProducts);

  FavoritesService() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString(_favoritesKey);
    if (favoritesJson != null) {
      final List<dynamic> decodedList = jsonDecode(favoritesJson);
      _favoriteProducts = decodedList
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = _favoriteProducts
        .map((product) => product.toJson())
        .toList();
    await prefs.setString(_favoritesKey, jsonEncode(jsonList));
  }

  void addProductToFavorites(Product product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeProductFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    _saveFavorites();
    notifyListeners();
  }

  bool isProductFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }
}
