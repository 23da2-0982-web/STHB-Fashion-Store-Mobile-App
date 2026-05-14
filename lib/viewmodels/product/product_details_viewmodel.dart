import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final Product product;
  
  String _selectedSize = '';
  int _selectedColor = 0;
  int _quantity = 1;
  bool _isDescriptionExpanded = false;

  ProductDetailsViewModel({required this.product}) {
    if (product.sizes.isNotEmpty) {
      _selectedSize = product.sizes[0]; // Default to first available size
    }
    if (product.colors.isNotEmpty) {
      _selectedColor = product.colors[0];
    }
  }

  String get selectedSize => _selectedSize;
  int get selectedColor => _selectedColor;
  int get quantity => _quantity;
  bool get isDescriptionExpanded => _isDescriptionExpanded;

  void toggleDescription() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    notifyListeners();
  }

  void setSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void setColor(int color) {
    _selectedColor = color;
    notifyListeners();
  }

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}
