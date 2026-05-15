import 'package:flutter/material.dart';
import 'package:stylehub_app/utils/app_assets.dart';
import '../../models/product.dart';
import '../../models/category.dart';

class HomeViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _selectedCategoryId = 'c1'; // Default selected is Women
  String get selectedCategoryId => _selectedCategoryId;

  String _currentLocation = 'Colombo, Sri Lanka';
  String get currentLocation => _currentLocation;

  // Mock Categories
  final List<Category> categories = [
    Category(
      id: 'c1',
      title: 'Women',
      imageUrl: kWomenCategoryPhoto,
    ), // Using high-end women category image
    Category(id: 'c2', title: 'Men', imageUrl: 'assets/images/blazer.png'),
    Category(
      id: 'c3',
      title: 'Kids',
      imageUrl: kKidsCategoryPhoto,
    ), // Using colorful kids store image
  ];

  // Master Product List
  final List<Product> _allProducts = [
    // WOMEN (c1)
    Product(
      id: 'w1',
      categoryId: 'c1',
      brand: 'MAISON LUXE',
      name: 'Linen Wrap Dress',
      price: 128.00,
      imageUrl: kFloralMaxiDressPhoto,
      isFavorite: false,
      rating: 4.8,
      reviewsCount: 32,
      description:
          'A beautifully tailored linen wrap dress, perfect for garden parties or sophisticated evening events.',
      sizes: ['S', 'M', 'L'],
      colors: [0xFFE6E6FA, 0xFFFFFFFF, 0xFF000000],
    ),
    Product(
      id: 'w2',
      categoryId: 'c1',
      brand: 'AURELIA',
      name: 'Silk Midi Skirt',
      price: 156.00,
      imageUrl: kUserProfilePhoto,
      isFavorite: true,
      rating: 5.0,
      reviewsCount: 15,
      description:
          'Flowing silk midi skirt with a subtle sheen, designed to move with grace.',
      sizes: ['XS', 'S', 'M', 'L'],
      colors: [0xFFDAA520, 0xFFF5F5DC, 0xFF8B4513],
    ),
    Product(
      id: 'w3',
      categoryId: 'c1',
      brand: 'ETHEREAL',
      name: 'Oversized Poplin Shirt',
      price: 95.00,
      imageUrl: 'assets/images/poplin_shirt.png',
      isFavorite: false,
      rating: 4.5,
      reviewsCount: 56,
      description:
          'Crisp Italian poplin shirt with a modern oversized silhouette.',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [0xFFFFFFFF, 0xFFADD8E6, 0xFFF5F5F5],
    ),

    // MEN (c2)
    Product(
      id: 'm1',
      categoryId: 'c2',
      brand: 'AURELIA',
      name: 'Structured Blazer',
      price: 245.00,
      imageUrl: 'assets/images/blazer.png',
      isFavorite: true,
      rating: 4.9,
      reviewsCount: 8,
      description:
          'Masterfully crafted blazer with sharp tailoring and premium wool blend.',
      sizes: ['M', 'L', 'XL', 'XXL'],
      colors: [0xFF000080, 0xFF2F4F4F, 0xFF000000],
    ),
    Product(
      id: 'm2',
      categoryId: 'c2',
      brand: 'URBAN',
      name: 'Classic Denim Jacket',
      price: 110.00,
      imageUrl: 'assets/images/denim.png',
      isFavorite: false,
      rating: 4.4,
      reviewsCount: 22,
      description:
          'The quintessential denim jacket, distressed for a lived-in feel.',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [0xFF4682B4, 0xFF191970],
    ),
    Product(
      id: 'm3',
      categoryId: 'c2',
      brand: 'MAISON LUXE',
      name: 'Premium Cotton Tee',
      price: 45.00,
      imageUrl: 'assets/images/blazer.png',
      isFavorite: false,
      rating: 4.2,
      reviewsCount: 41,
      description: 'Heavyweight organic cotton tee with a perfect relaxed fit.',
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      colors: [0xFFFFFFFF, 0xFF000000, 0xFF808080, 0xFFF5F5DC],
    ),

    // KIDS (c3)
    Product(
      id: 'k1',
      categoryId: 'c3',
      brand: 'LITTLE STAR',
      name: 'Mini Gingham Dress',
      price: 48.00,
      imageUrl: kUserProfilePhoto,
      isFavorite: false,
      rating: 4.7,
      reviewsCount: 12,
      description:
          'Adorable gingham dress for the little ones, made from soft breathable cotton.',
      sizes: ['2T', '3T', '4T', '5T'],
      colors: [0xFFFFB6C1, 0xFFAFEEEE, 0xFFFFFACD],
    ),
    Product(
      id: 'k2',
      categoryId: 'c3',
      brand: 'KIDDO',
      name: 'Tiny Denim Overalls',
      price: 55.00,
      imageUrl: 'assets/images/denim.png',
      isFavorite: true,
      rating: 4.9,
      reviewsCount: 5,
      description: 'Durable and cute denim overalls for active play.',
      sizes: ['2T', '3T', '4T'],
      colors: [0xFF4682B4, 0xFFADD8E6],
    ),
  ];

  List<Product> get featuredProducts =>
      _allProducts.where((p) => p.categoryId == _selectedCategoryId).toList();
  List<Product> get trendingProducts => _allProducts
      .where((p) => p.categoryId == _selectedCategoryId)
      .toList()
      .reversed
      .toList();

  // Mock Summer Collection Products (Static for Catalog)
  List<Product> summerCollectionProducts = [
    Product(
      id: 's1',
      categoryId: 'c1',
      brand: 'STYLEHUB EXCLUSIVE',
      name: 'The Atelier Silk Wrap Gown',
      price: 349.00,
      imageUrl: kUserProfilePhoto,
      isFavorite: false,
      rating: 5.0,
      reviewsCount: 128,
      description:
          'Crafted from our signature heavyweight Italian mulberry silk, the Atelier Wrap Gown features an asymmetrical hemline and intricate tonal stitching. Designed for fluidity and effortless grace.',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      colors: [0xFF1C1C2D, 0xFF8B7355, 0xFFE0E0E0, 0xFFF5F5DC],
    ),
    Product(
      id: 's2',
      categoryId: 'c1',
      brand: 'AURELIA',
      name: 'Backless Silk Halter Top',
      price: 125.00,
      imageUrl: 'assets/images/blazer.png',
      isFavorite: true,
      rating: 4.8,
      reviewsCount: 45,
      description: 'Elegant silk top with a backless design.',
    ),
    Product(
      id: 's3',
      categoryId: 'c1',
      brand: 'ETHEREAL',
      name: 'Oversized Poplin Shirt',
      price: 95.00,
      imageUrl: 'assets/images/poplin_shirt.png',
      isFavorite: false,
      rating: 4.5,
      reviewsCount: 32,
      description: 'Classic oversized shirt in premium poplin.',
    ),
    Product(
      id: 's4',
      categoryId: 'c1',
      brand: 'MAISON LUXE',
      name: 'Sun-Pleated Maxi Skirt',
      price: 210.00,
      imageUrl: 'assets/images/pleated_skirt.png',
      isFavorite: false,
      rating: 4.9,
      reviewsCount: 68,
      description: 'Flowy maxi skirt with intricate sun-pleats.',
    ),
    Product(
      id: 's5',
      categoryId: 'c1',
      brand: 'AURELIA',
      name: 'Gingham Picnic Dress',
      price: 145.00,
      imageUrl: 'assets/images/denim.png',
      isFavorite: true,
      rating: 4.7,
      reviewsCount: 91,
      description: 'Charming gingham dress perfect for summer outings.',
    ),
    Product(
      id: 's6',
      categoryId: 'c1',
      brand: 'ETHEREAL',
      name: 'Summer Knit Co-ord',
      price: 160.00,
      imageUrl: kUserProfilePhoto,
      isFavorite: false,
      rating: 4.6,
      reviewsCount: 24,
      description: 'Lightweight knit set for a coordinated summer look.',
    ),
  ];

  void setBottomNavIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void selectCategory(String id) {
    _selectedCategoryId = id;
    notifyListeners();
  }

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    var index = _allProducts.indexWhere((p) => p.id == id);
    if (index != -1) {
      _allProducts[index] = _allProducts[index].copyWith(
        isFavorite: !_allProducts[index].isFavorite,
      );
      notifyListeners();
    }
  }
}
