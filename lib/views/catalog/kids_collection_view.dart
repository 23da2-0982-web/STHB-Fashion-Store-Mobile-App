import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylehub_app/utils/app_assets.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';
import '../placeholders/placeholders.dart';

class KidsCollectionView extends StatefulWidget {
  const KidsCollectionView({super.key});

  @override
  State<KidsCollectionView> createState() => _KidsCollectionViewState();
}

class _KidsCollectionViewState extends State<KidsCollectionView> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Girls', 'Boys', 'Baby', 'Sets', 'Party'];

  static const List<Map<String, dynamic>> _productData = [
    {'name': 'Floral Ruffle Dress', 'brand': 'LITTLE STAR', 'price': 38.99, 'rating': 4.9, 'reviews': 142, 'tag': 'Girls'},
    {'name': 'Rainbow Puffer Jacket', 'brand': 'KIDDO', 'price': 62.00, 'rating': 4.7, 'reviews': 88, 'tag': 'Girls'},
    {'name': 'Denim Dungarees', 'brand': 'TINY THREADS', 'price': 45.00, 'rating': 4.8, 'reviews': 113, 'tag': 'Boys'},
    {'name': 'Party Princess Dress', 'brand': 'DREAM KIDS', 'price': 78.00, 'rating': 5.0, 'reviews': 67, 'tag': 'Party'},
    {'name': 'Soft Cotton Onesie', 'brand': 'BABY BLISS', 'price': 22.99, 'rating': 4.6, 'reviews': 204, 'tag': 'Baby'},
    {'name': 'Striped Tee & Shorts Set', 'brand': 'KIDDO', 'price': 34.00, 'rating': 4.5, 'reviews': 95, 'tag': 'Sets'},
    {'name': 'Gingham Smock Dress', 'brand': 'LITTLE STAR', 'price': 42.00, 'rating': 4.8, 'reviews': 77, 'tag': 'Girls'},
    {'name': 'Cool Graphic Tee', 'brand': 'MINI MODE', 'price': 19.99, 'rating': 4.4, 'reviews': 156, 'tag': 'Boys'},
    {'name': 'Tutu Ballerina Skirt', 'brand': 'DREAM KIDS', 'price': 28.00, 'rating': 4.9, 'reviews': 91, 'tag': 'Girls'},
    {'name': 'Cargo Shorts', 'brand': 'TINY THREADS', 'price': 25.00, 'rating': 4.3, 'reviews': 72, 'tag': 'Boys'},
    {'name': 'Knit Romper', 'brand': 'BABY BLISS', 'price': 31.00, 'rating': 4.7, 'reviews': 118, 'tag': 'Baby'},
    {'name': 'Matching Sibling Set', 'brand': 'LITTLE STAR', 'price': 68.00, 'rating': 4.9, 'reviews': 54, 'tag': 'Sets'},
    {'name': 'Butterfly Print Dress', 'brand': 'DREAM KIDS', 'price': 46.00, 'rating': 4.7, 'reviews': 83, 'tag': 'Girls'},
    {'name': 'Jogger Track Suit', 'brand': 'KIDDO', 'price': 52.00, 'rating': 4.6, 'reviews': 99, 'tag': 'Boys'},
    {'name': 'Fairy Tale Gown', 'brand': 'DREAM KIDS', 'price': 89.00, 'rating': 5.0, 'reviews': 43, 'tag': 'Party'},
    {'name': 'Sleeveless Bodysuit', 'brand': 'BABY BLISS', 'price': 18.00, 'rating': 4.5, 'reviews': 167, 'tag': 'Baby'},
    {'name': 'Linen Co-ord Set', 'brand': 'MINI MODE', 'price': 55.00, 'rating': 4.6, 'reviews': 61, 'tag': 'Sets'},
    {'name': 'Polka Dot Sundress', 'brand': 'LITTLE STAR', 'price': 36.00, 'rating': 4.8, 'reviews': 108, 'tag': 'Girls'},
    {'name': 'Denim Jacket', 'brand': 'TINY THREADS', 'price': 48.00, 'rating': 4.5, 'reviews': 74, 'tag': 'Boys'},
    {'name': 'Sequin Party Dress', 'brand': 'DREAM KIDS', 'price': 72.00, 'rating': 4.9, 'reviews': 39, 'tag': 'Party'},
    {'name': 'Fleece Sleepsuit', 'brand': 'BABY BLISS', 'price': 26.00, 'rating': 4.7, 'reviews': 188, 'tag': 'Baby'},
    {'name': 'Twin Pocket Tee Set', 'brand': 'KIDDO', 'price': 39.00, 'rating': 4.4, 'reviews': 57, 'tag': 'Sets'},
    {'name': 'Smocked Midi Dress', 'brand': 'LITTLE STAR', 'price': 53.00, 'rating': 4.8, 'reviews': 86, 'tag': 'Girls'},
    {'name': 'Hoodie & Jogger Set', 'brand': 'MINI MODE', 'price': 59.00, 'rating': 4.6, 'reviews': 92, 'tag': 'Boys'},
    {'name': 'Glitter Party Frock', 'brand': 'DREAM KIDS', 'price': 65.00, 'rating': 4.9, 'reviews': 48, 'tag': 'Party'},
    {'name': 'Newborn Gift Set', 'brand': 'BABY BLISS', 'price': 44.00, 'rating': 5.0, 'reviews': 132, 'tag': 'Baby'},
    {'name': 'Summer Play Set', 'brand': 'TINY THREADS', 'price': 41.00, 'rating': 4.5, 'reviews': 69, 'tag': 'Sets'},
    {'name': 'Tiered Flounce Dress', 'brand': 'DREAM KIDS', 'price': 49.00, 'rating': 4.7, 'reviews': 77, 'tag': 'Girls'},
    {'name': 'Chino Trousers', 'brand': 'MINI MODE', 'price': 32.00, 'rating': 4.4, 'reviews': 84, 'tag': 'Boys'},
    {'name': 'Velvet Bow Dress', 'brand': 'LITTLE STAR', 'price': 82.00, 'rating': 5.0, 'reviews': 36, 'tag': 'Party'},
    {'name': 'Bamboo Baby Wrap', 'brand': 'BABY BLISS', 'price': 29.00, 'rating': 4.8, 'reviews': 144, 'tag': 'Baby'},
    {'name': 'Tropical Print Set', 'brand': 'KIDDO', 'price': 44.00, 'rating': 4.5, 'reviews': 63, 'tag': 'Sets'},
    {'name': 'Daisy Print Dress', 'brand': 'LITTLE STAR', 'price': 38.00, 'rating': 4.6, 'reviews': 101, 'tag': 'Girls'},
    {'name': 'Varsity Bomber Jacket', 'brand': 'TINY THREADS', 'price': 56.00, 'rating': 4.7, 'reviews': 55, 'tag': 'Boys'},
    {'name': 'Tulle Birthday Dress', 'brand': 'DREAM KIDS', 'price': 94.00, 'rating': 5.0, 'reviews': 29, 'tag': 'Party'},
    {'name': 'Organic Cotton Bib Set', 'brand': 'BABY BLISS', 'price': 15.00, 'rating': 4.9, 'reviews': 213, 'tag': 'Baby'},
    {'name': 'Pyjama Set', 'brand': 'MINI MODE', 'price': 32.00, 'rating': 4.6, 'reviews': 78, 'tag': 'Sets'},
    {'name': 'Floral Wrap Skirt', 'brand': 'LITTLE STAR', 'price': 27.00, 'rating': 4.5, 'reviews': 66, 'tag': 'Girls'},
    {'name': 'Print Swim Trunks', 'brand': 'KIDDO', 'price': 21.00, 'rating': 4.4, 'reviews': 93, 'tag': 'Boys'},
    {'name': 'Lace Party Frock', 'brand': 'DREAM KIDS', 'price': 76.00, 'rating': 4.9, 'reviews': 41, 'tag': 'Party'},
    {'name': 'Cotton Muslin Swaddle', 'brand': 'BABY BLISS', 'price': 19.00, 'rating': 4.8, 'reviews': 177, 'tag': 'Baby'},
    {'name': 'Colour Block Co-ord', 'brand': 'TINY THREADS', 'price': 47.00, 'rating': 4.5, 'reviews': 58, 'tag': 'Sets'},
    {'name': 'Bow Collar Dress', 'brand': 'DREAM KIDS', 'price': 54.00, 'rating': 4.7, 'reviews': 73, 'tag': 'Girls'},
    {'name': 'Ripped Slim Jeans', 'brand': 'MINI MODE', 'price': 38.00, 'rating': 4.4, 'reviews': 87, 'tag': 'Boys'},
    {'name': 'Mermaid Costume Dress', 'brand': 'DREAM KIDS', 'price': 68.00, 'rating': 5.0, 'reviews': 52, 'tag': 'Party'},
    {'name': 'Plush Sleep Sack', 'brand': 'BABY BLISS', 'price': 34.00, 'rating': 4.9, 'reviews': 165, 'tag': 'Baby'},
    {'name': 'Grid Flannel Set', 'brand': 'KIDDO', 'price': 42.00, 'rating': 4.5, 'reviews': 61, 'tag': 'Sets'},
    {'name': 'Broderie Anglaise Dress', 'brand': 'LITTLE STAR', 'price': 59.00, 'rating': 4.8, 'reviews': 80, 'tag': 'Girls'},
    {'name': 'Pull-On Cargo Pants', 'brand': 'TINY THREADS', 'price': 29.00, 'rating': 4.3, 'reviews': 96, 'tag': 'Boys'},
    {'name': 'Unicorn Party Dress', 'brand': 'DREAM KIDS', 'price': 71.00, 'rating': 5.0, 'reviews': 44, 'tag': 'Party'},
    {'name': 'Knitted Cardigan & Booties', 'brand': 'BABY BLISS', 'price': 38.00, 'rating': 4.8, 'reviews': 121, 'tag': 'Baby'},
    {'name': 'Beach Day Set', 'brand': 'MINI MODE', 'price': 35.00, 'rating': 4.6, 'reviews': 68, 'tag': 'Sets'},
    {'name': 'Cherry Print Dress', 'brand': 'LITTLE STAR', 'price': 43.00, 'rating': 4.7, 'reviews': 89, 'tag': 'Girls'},
    {'name': 'Athletic Shorts', 'brand': 'KIDDO', 'price': 18.00, 'rating': 4.4, 'reviews': 112, 'tag': 'Boys'},
    {'name': 'Princess Ball Gown', 'brand': 'DREAM KIDS', 'price': 98.00, 'rating': 5.0, 'reviews': 33, 'tag': 'Party'},
    {'name': 'Terry Hooded Towel', 'brand': 'BABY BLISS', 'price': 24.00, 'rating': 4.7, 'reviews': 148, 'tag': 'Baby'},
    {'name': 'Dino Print Pyjama Set', 'brand': 'TINY THREADS', 'price': 30.00, 'rating': 4.6, 'reviews': 75, 'tag': 'Sets'},
  ];

  List<Product> get _filteredProducts {
    final all = List.generate(_productData.length, (i) {
      final d = _productData[i];
      final imgIndex = i % kKidsCollectionPhotos.length;
      return Product(
        id: 'kids_$i',
        categoryId: 'c3',
        brand: d['brand'] as String,
        name: d['name'] as String,
        price: (d['price'] as num).toDouble(),
        imageUrl: kKidsCollectionPhotos[imgIndex],
        rating: (d['rating'] as num).toDouble(),
        reviewsCount: d['reviews'] as int,
        description: '${d['name']} — stylish, comfortable and perfect for little ones.',
        sizes: const ['2T', '3T', '4T', '5T', '6T'],
        colors: const [0xFFFF6B9D, 0xFF4ECDC4, 0xFFFFD93D, 0xFF6BCF7F, 0xFF45B7D1],
      );
    });
    if (_selectedFilter == 'All') return all;
    return all
        .where((p) => _productData[int.parse(p.id.split('_').last)]['tag'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "KIDS' COLLECTION",
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
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
          // Hero Banner
          Container(
            width: double.infinity,
            height: 155,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF6B9D), Color(0xFFFFD93D)],
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
                      Text('New Season ✨', style: GoogleFonts.inter(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('${products.length}+ Kids\nStyles', style: GoogleFonts.inter(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.2)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text('UP TO 30% OFF', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFFFF6B9D))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0, bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(20)),
                    child: Image.asset(kKidsCategoryPhoto, width: 120, height: 130, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
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
                      color: selected ? const Color(0xFFFF6B9D) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: selected ? const Color(0xFFFF6B9D) : Colors.grey.shade300),
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
          const SizedBox(height: 10),
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
          // Product Grid
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
