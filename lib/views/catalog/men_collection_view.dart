import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../placeholders/placeholders.dart';

class MenCollectionView extends StatelessWidget {
  const MenCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.flash_on, color: Color(0xFF141421)),
        titleSpacing: 0,
        title: Text(
          'STYLEHUB',
          style: GoogleFonts.playfairDisplay(
            color: const Color(0xFF141421),
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
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
                          Text('Send to', style: GoogleFonts.inter(fontSize: 10, color: Colors.grey)),
                          Text('Malang, Indonesia', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
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
                  color: const Color(0xFF1C1C2D),
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
                            "Don't miss out —",
                            style: GoogleFonts.inter(color: Colors.white70, fontSize: 13),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Save up to 50% on your\nfavorite products.",
                            style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Shop Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
                          'assets/images/blazer.png',
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
            // Popular Brand
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Popular Brand', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 24),
                children: [
                  _buildBrandIcon('H&M'),
                  _buildBrandIcon('Zara'),
                  _buildBrandIcon('Lacoste'),
                  _buildBrandIcon('Ralph L'),
                  _buildBrandIcon('Puma'),
                ],
              ),
            ),

            const SizedBox(height: 32),
            // Flash Sale
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Flash Sale', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC62828),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '11 : 12 : 02',
                      style: GoogleFonts.azeretMono(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
              children: [
                _buildSaleItem('T-Shirt Tomorrow', '\$12.00', '4.8', 'assets/images/blazer.png'),
                _buildSaleItem('Hoodie STWD', '\$15.00', '4.7', 'assets/images/denim.png'),
                _buildSaleItem('Casual Shirt', '\$20.00', '4.9', 'assets/images/poplin_shirt.png'),
                _buildSaleItem('Wool Overcoat', '\$85.00', '5.0', 'assets/images/blazer.png'),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandIcon(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Center(child: Text(name[0], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          ),
          const SizedBox(height: 8),
          Text(name, style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildSaleItem(String name, String price, String rating, String img) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(name, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(price, style: GoogleFonts.playfairDisplay(fontSize: 14, fontWeight: FontWeight.w900, color: const Color(0xFF8B7355))),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text(rating, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
