import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/model/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService with ChangeNotifier {
  List<CartItem> _cartItems = [];
  static const String _cartKey = 'cartItems';

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  CartService() {
    _loadCart();
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final List<dynamic> decodedList = jsonDecode(cartJson);
      _cartItems = decodedList
          .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = _cartItems
        .map((item) => item.toJson())
        .toList();
    await prefs.setString(_cartKey, jsonEncode(jsonList));
  }

  void addProductToCart(
    Product product, {
    int quantity = 1,
    String? selectedColor,
    String? selectedSize,
  }) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedColor == selectedColor &&
          item.selectedSize == selectedSize,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity += quantity;
    } else {
      _cartItems.add(
        CartItem(
          product: product,
          quantity: quantity,
          selectedColor: selectedColor,
          selectedSize: selectedSize,
        ),
      );
    }
    _saveCart();
    notifyListeners();
  }

  void quickAddToCart(Product product) {
    addProductToCart(
      product,
      quantity: 1,
      selectedColor: null,
      selectedSize: null,
    );
  }

  void removeProductFromCart(CartItem item) {
    _cartItems.remove(item);
    _saveCart();
    notifyListeners();
  }

  void updateCartItemQuantity(CartItem item, int newQuantity) {
    if (newQuantity > 0) {
      final index = _cartItems.indexOf(item);
      if (index != -1) {
        _cartItems[index].quantity = newQuantity;
        _saveCart();
        notifyListeners();
      }
    } else {
      removeProductFromCart(item);
    }
  }

  int get totalUniqueItemsInCart {
    return _cartItems.length;
  }

  int get totalQuantityInCart {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get cartTotal {
    return _cartItems.fold(0.0, (sum, item) {
      final newPrice =
          double.tryParse(item.product.newPrice.replaceAll('\$', '')) ?? 0.0;
      return sum + (newPrice * item.quantity);
    });
  }
}
