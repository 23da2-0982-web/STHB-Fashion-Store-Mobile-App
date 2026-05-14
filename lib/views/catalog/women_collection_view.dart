import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';
import '../placeholders/placeholders.dart';

class WomenCollectionView extends StatefulWidget {
  const WomenCollectionView({super.key});

  @override
  State<WomenCollectionView> createState() => _WomenCollectionViewState();
}

class _WomenCollectionViewState extends State<WomenCollectionView> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Dresses', 'Tops', 'Skirts', 'Casual', 'Evening'];

  // Product names, brands, prices mapped to each image in kWomenCollectionPhotos
  static const List<Map<String, dynamic>> _productData = [
    {'name': 'Floral Maxi Dress', 'brand': 'MAISON LUXE', 'price': 89.99, 'rating': 4.8, 'reviews': 124, 'tag': 'Dresses'},
    {'name': 'Little Black Dress', 'brand': 'CHIC BOUTIQUE', 'price': 129.99, 'rating': 4.9, 'reviews': 89, 'tag': 'Evening'},
    {'name': 'Boho Sundress', 'brand': 'SUMMER VIBES', 'price': 59.99, 'rating': 4.7, 'reviews': 156, 'tag': 'Casual'},
    {'name': 'Linen Wrap Dress', 'brand': 'ETHEREAL', 'price': 98.00, 'rating': 4.6, 'reviews': 72, 'tag': 'Dresses'},
    {'name': 'Sun-Pleated Maxi Skirt', 'brand': 'AURELIA', 'price': 75.00, 'rating': 4.9, 'reviews': 68, 'tag': 'Skirts'},
    {'name': 'Oversized Poplin Shirt', 'brand': 'ETHEREAL', 'price': 55.00, 'rating': 4.5, 'reviews': 56, 'tag': 'Tops'},
    {'name': 'Ruffle Midi Dress', 'brand': 'BELLE FEMME', 'price': 112.00, 'rating': 4.7, 'reviews': 93, 'tag': 'Dresses'},
    {'name': 'Flowy Chiffon Top', 'brand': 'AURELIA', 'price': 45.00, 'rating': 4.4, 'reviews': 48, 'tag': 'Tops'},
    {'name': 'Vintage Floral Dress', 'brand': 'RETRO CHIC', 'price': 79.99, 'rating': 4.6, 'reviews': 111, 'tag': 'Dresses'},
    {'name': 'Sequin Cocktail Dress', 'brand': 'EVENING GLAM', 'price': 199.99, 'rating': 5.0, 'reviews': 67, 'tag': 'Evening'},
    {'name': 'Pastel Midi Skirt', 'brand': 'SOFT STUDIO', 'price': 64.00, 'rating': 4.5, 'reviews': 38, 'tag': 'Skirts'},
    {'name': 'Wrap Blouse', 'brand': 'MAISON LUXE', 'price': 52.00, 'rating': 4.3, 'reviews': 29, 'tag': 'Tops'},
    {'name': 'Silk Slip Dress', 'brand': 'LUMIERE', 'price': 145.00, 'rating': 4.8, 'reviews': 84, 'tag': 'Evening'},
    {'name': 'Garden Party Dress', 'brand': 'BLOOM & CO', 'price': 92.00, 'rating': 4.7, 'reviews': 107, 'tag': 'Dresses'},
    {'name': 'Lace Trim Cami', 'brand': 'DELICATE', 'price': 38.00, 'rating': 4.2, 'reviews': 44, 'tag': 'Tops'},
    {'name': 'Tiered Boho Skirt', 'brand': 'EARTH TONES', 'price': 58.00, 'rating': 4.5, 'reviews': 61, 'tag': 'Skirts'},
    {'name': 'Satin Wrap Dress', 'brand': 'LUMIERE', 'price': 118.00, 'rating': 4.9, 'reviews': 77, 'tag': 'Dresses'},
    {'name': 'Cotton Sundress', 'brand': 'SUMMER VIBES', 'price': 49.99, 'rating': 4.4, 'reviews': 132, 'tag': 'Casual'},
    {'name': 'Embroidered Midi Dress', 'brand': 'ARTISAN', 'price': 135.00, 'rating': 4.8, 'reviews': 55, 'tag': 'Dresses'},
    {'name': 'Off-Shoulder Top', 'brand': 'BELLE FEMME', 'price': 42.00, 'rating': 4.3, 'reviews': 88, 'tag': 'Tops'},
    {'name': 'Gingham Mini Dress', 'brand': 'RETRO CHIC', 'price': 68.00, 'rating': 4.6, 'reviews': 99, 'tag': 'Casual'},
    {'name': 'Velvet Evening Gown', 'brand': 'NOIR LUXE', 'price': 289.00, 'rating': 5.0, 'reviews': 43, 'tag': 'Evening'},
    {'name': 'Smocked Waist Dress', 'brand': 'BLOOM & CO', 'price': 72.00, 'rating': 4.7, 'reviews': 66, 'tag': 'Dresses'},
    {'name': 'Crop Linen Shirt', 'brand': 'MINIMAL', 'price': 46.00, 'rating': 4.4, 'reviews': 51, 'tag': 'Tops'},
    {'name': 'A-Line Floral Dress', 'brand': 'GARDEN PARTY', 'price': 85.00, 'rating': 4.6, 'reviews': 78, 'tag': 'Dresses'},
    {'name': 'Printed Wrap Skirt', 'brand': 'TROPICAL', 'price': 55.00, 'rating': 4.5, 'reviews': 34, 'tag': 'Skirts'},
    {'name': 'Asymmetric Hem Dress', 'brand': 'AVANT GARDE', 'price': 158.00, 'rating': 4.8, 'reviews': 29, 'tag': 'Evening'},
    {'name': 'Puff Sleeve Blouse', 'brand': 'ROMANTIC', 'price': 61.00, 'rating': 4.3, 'reviews': 57, 'tag': 'Tops'},
    {'name': 'Casual Shirt Dress', 'brand': 'MINIMAL', 'price': 78.00, 'rating': 4.5, 'reviews': 90, 'tag': 'Casual'},
    {'name': 'Halter Neck Dress', 'brand': 'AURELIA', 'price': 96.00, 'rating': 4.7, 'reviews': 62, 'tag': 'Dresses'},
    {'name': 'Pleated Mini Skirt', 'brand': 'CHIC BOUTIQUE', 'price': 48.00, 'rating': 4.4, 'reviews': 73, 'tag': 'Skirts'},
    {'name': 'French Tuck Blouse', 'brand': 'PARISIAN', 'price': 54.00, 'rating': 4.6, 'reviews': 45, 'tag': 'Tops'},
    {'name': 'Maxi Wrap Dress', 'brand': 'MAISON LUXE', 'price': 132.00, 'rating': 4.9, 'reviews': 81, 'tag': 'Dresses'},
    {'name': 'Ditsy Print Dress', 'brand': 'BLOOM & CO', 'price': 67.00, 'rating': 4.5, 'reviews': 94, 'tag': 'Casual'},
    {'name': 'Gold Trim Evening Dress', 'brand': 'NOIR LUXE', 'price': 245.00, 'rating': 4.9, 'reviews': 38, 'tag': 'Evening'},
    {'name': 'Relaxed Linen Pants', 'brand': 'EARTH TONES', 'price': 72.00, 'rating': 4.4, 'reviews': 59, 'tag': 'Casual'},
    {'name': 'Floral Shirt Dress', 'brand': 'RETRO CHIC', 'price': 88.00, 'rating': 4.6, 'reviews': 103, 'tag': 'Dresses'},
    {'name': 'Ruched Bodycon Dress', 'brand': 'BELLE FEMME', 'price': 95.00, 'rating': 4.7, 'reviews': 70, 'tag': 'Evening'},
    {'name': 'Eyelet Lace Dress', 'brand': 'DELICATE', 'price': 109.00, 'rating': 4.8, 'reviews': 52, 'tag': 'Dresses'},
    {'name': 'Ribbed Knit Top', 'brand': 'MINIMAL', 'price': 32.00, 'rating': 4.3, 'reviews': 88, 'tag': 'Tops'},
    {'name': 'Peasant Maxi Dress', 'brand': 'ARTISAN', 'price': 76.00, 'rating': 4.5, 'reviews': 67, 'tag': 'Casual'},
    {'name': 'Strapless Satin Gown', 'brand': 'NOIR LUXE', 'price': 320.00, 'rating': 5.0, 'reviews': 31, 'tag': 'Evening'},
    {'name': 'Flowy Palazzo Set', 'brand': 'RESORT', 'price': 118.00, 'rating': 4.6, 'reviews': 46, 'tag': 'Casual'},
    {'name': 'Broderie Dress', 'brand': 'BLOOM & CO', 'price': 102.00, 'rating': 4.7, 'reviews': 58, 'tag': 'Dresses'},
    {'name': 'Sheer Overlay Dress', 'brand': 'LUMIERE', 'price': 175.00, 'rating': 4.9, 'reviews': 40, 'tag': 'Evening'},
    {'name': 'Stripe Linen Shirt', 'brand': 'COASTAL', 'price': 49.00, 'rating': 4.4, 'reviews': 66, 'tag': 'Tops'},
    {'name': 'Ombre Midi Dress', 'brand': 'ARTISAN', 'price': 122.00, 'rating': 4.7, 'reviews': 49, 'tag': 'Dresses'},
    {'name': 'Balloon Sleeve Top', 'brand': 'ROMANTIC', 'price': 58.00, 'rating': 4.5, 'reviews': 37, 'tag': 'Tops'},
    {'name': 'Backless Sundress', 'brand': 'SUMMER VIBES', 'price': 69.99, 'rating': 4.6, 'reviews': 85, 'tag': 'Casual'},
    {'name': 'Jewel-Neck Dress', 'brand': 'PARISIAN', 'price': 140.00, 'rating': 4.8, 'reviews': 44, 'tag': 'Evening'},
    {'name': 'Tiered Ruffle Dress', 'brand': 'BELLE FEMME', 'price': 84.00, 'rating': 4.5, 'reviews': 71, 'tag': 'Dresses'},
    {'name': 'Tropical Print Dress', 'brand': 'RESORT', 'price': 79.00, 'rating': 4.6, 'reviews': 60, 'tag': 'Casual'},
    {'name': 'Cowl Neck Midi', 'brand': 'MINIMAL', 'price': 115.00, 'rating': 4.7, 'reviews': 53, 'tag': 'Dresses'},
    {'name': 'Spaghetti Strap Dress', 'brand': 'CHIC BOUTIQUE', 'price': 62.00, 'rating': 4.4, 'reviews': 79, 'tag': 'Casual'},
    {'name': 'Geometric Print Dress', 'brand': 'AVANT GARDE', 'price': 98.00, 'rating': 4.6, 'reviews': 42, 'tag': 'Dresses'},
    {'name': 'Breezy Kaftan Dress', 'brand': 'RESORT', 'price': 88.00, 'rating': 4.5, 'reviews': 35, 'tag': 'Casual'},
  ];

  List<Product> get _filteredProducts {
    final all = List.generate(
      _productData.length,
      (i) {
        final d = _productData[i];
        final imgIndex = i % kWomenCollectionPhotos.length;
        return Product(
          id: 'w_all_$i',
          categoryId: 'women_dresses',
          brand: d['brand'] as String,
          name: d['name'] as String,
          price: (d['price'] as num).toDouble(),
          imageUrl: kWomenCollectionPhotos[imgIndex],
          rating: (d['rating'] as num).toDouble(),
          reviewsCount: d['reviews'] as int,
          description: '${d['name']} — a must-have piece for the modern woman.',
          sizes: const ['XS', 'S', 'M', 'L', 'XL'],
          colors: const [0xFFE91E63, 0xFF9C27B0, 0xFF000000, 0xFFFFFFFF],
        );
      },
    );
    if (_selectedFilter == 'All') return all;
    return all
        .where((p) => _productData[int.parse(p.id.split('_').last)]['tag'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "WOMEN'S COLLECTION",
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CartPlaceholderView()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Promo Banner
          Container(
            width: double.infinity,
            height: 140,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFFE91E63), Color(0xFF9C27B0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New Season —', style: GoogleFonts.inter(color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text('${products.length}+ Styles\nJust Arrived', style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1.3)),
                    ],
                  ),
                ),
                Positioned(
                  right: 0, bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(16)),
                    child: Image.asset(kWomenCategoryPhoto, width: 110, height: 130, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Filter chips
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filters.length,
              itemBuilder: (_, i) {
                final f = _filters[i];
                final selected = _selectedFilter == f;
                return GestureDetector(
                  onTap: () => setState(() => _selectedFilter = f),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFFE91E63) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: selected ? const Color(0xFFE91E63) : Colors.grey.shade300),
                    ),
                    child: Text(
                      f,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: selected ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Count row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${products.length} items', style: GoogleFonts.inter(fontSize: 13, color: Colors.grey[600])),
                Row(children: [
                  const Icon(Icons.sort, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('Sort', style: GoogleFonts.inter(fontSize: 13, color: Colors.grey[600])),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: 0.68,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onFavoriteTap: () => setState(() {}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}