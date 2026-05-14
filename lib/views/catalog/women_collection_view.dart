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
  // Sample women's dresses data - in a real app, this would come from a viewmodel or API
  final List<Product> _womenDresses = [
    Product(
      id: 'wd1',
      categoryId: 'women_dresses',
      brand: 'Elegant Wear',
      name: 'Floral Maxi Dress',
      price: 89.99,
      imageUrl: kFloralMaxiDressPhoto,
      rating: 4.8,
      reviewsCount: 124,
      description: 'Beautiful floral maxi dress perfect for summer occasions.',
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      colors: [0xFFFF6B6B, 0xFF4ECDC4, 0xFF45B7D1],
    ),
    Product(
      id: 'wd2',
      categoryId: 'women_dresses',
      brand: 'Chic Boutique',
      name: 'Little Black Dress',
      price: 129.99,
      imageUrl: kLittleBlackDressPhoto,
      rating: 4.9,
      reviewsCount: 89,
      description: 'Classic little black dress that never goes out of style.',
      sizes: ['XS', 'S', 'M', 'L'],
      colors: [0xFF000000, 0xFF8B4513, 0xFFDC143C],
    ),
    Product(
      id: 'wd3',
      categoryId: 'women_dresses',
      brand: 'Summer Vibes',
      name: 'Boho Sundress',
      price: 59.99,
      imageUrl: kBohoSundressPhoto,
      rating: 4.7,
      reviewsCount: 156,
      description: 'Flowy boho sundress with intricate patterns.',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [0xFFFFD93D, 0xFF6BCF7F, 0xFF4D96FF],
    ),
    Product(
      id: 'wd4',
      categoryId: 'women_dresses',
      brand: 'Evening Glam',
      name: 'Sequin Cocktail Dress',
      price: 199.99,
      imageUrl: kLittleBlackDressPhoto, // Reusing high-quality asset
      rating: 5.0,
      reviewsCount: 67,
      description: 'Stunning sequin cocktail dress for special occasions.',
      sizes: ['XS', 'S', 'M', 'L'],
      colors: [0xFFFFC0CB, 0xFF9370DB, 0xFF00CED1],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'WOMEN\'S DRESSES',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartPlaceholderView()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Picker
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Deliver to', style: GoogleFonts.inter(fontSize: 10, color: Colors.grey)),
                          Text('New York, NY', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF8B7355),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Change', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),

            // Promo Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE91E63), Color(0xFF9C27B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Collection —",
                            style: GoogleFonts.inter(color: Colors.white70, fontSize: 13),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Elegant dresses for\nevery occasion.",
                            style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Explore Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
                        child: Image.asset(
                          kWomenCategoryPhoto,
                          width: 120,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Categories', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 24),
                children: [
                  _buildCategoryIcon('Maxi Dresses'),
                  _buildCategoryIcon('Cocktail'),
                  _buildCategoryIcon('Sundresses'),
                  _buildCategoryIcon('Evening Wear'),
                  _buildCategoryIcon('Casual'),
                ],
              ),
            ),

            const SizedBox(height: 32),
            // Featured Dresses
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Dresses', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All', style: GoogleFonts.inter(color: Colors.pink, fontSize: 14)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 0.7,
              ),
              itemCount: _womenDresses.length,
              itemBuilder: (context, index) {
                final product = _womenDresses[index];
                return ProductCard(
                  product: product,
                  onFavoriteTap: () {
                    // Handle favorite toggle
                    setState(() {
                      // Toggle favorite status
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.pink[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink[100]!),
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.pink[700],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}