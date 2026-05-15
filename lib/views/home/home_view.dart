import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../widgets/category_item.dart';
import '../../widgets/product_card.dart';
import 'package:stylehub_app/utils/app_assets.dart';
import '../catalog/catalog_view.dart';

import '../orders/order_history_view.dart';
import '../profile/profile_view.dart';
import '../placeholders/placeholders.dart';
import '../ensemble/ensemble_view.dart';
import '../catalog/women_collection_view.dart';
import '../catalog/men_collection_view.dart';
import '../catalog/kids_collection_view.dart';
import '../../widgets/style_hub_logo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = HomeViewModel();

  final List<Widget> _screens = [
    const _HomeContent(),
    const SearchPlaceholderView(),
    const CartPlaceholderView(),
    const OrderHistoryView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFFBFBFB),
          body: IndexedStack(
            index: _viewModel.selectedIndex,
            children: _screens.map((screen) {
              // Inject viewmodel if needed or just use as is
              if (screen is _HomeContent) {
                return _HomeContent(viewModel: _viewModel);
              }
              return screen;
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _viewModel.selectedIndex,
            onTap: _viewModel.setBottomNavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF8B7355),
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'SEARCH',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'CART',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                label: 'ORDERS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'PROFILE',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  final HomeViewModel? viewModel;
  const _HomeContent({this.viewModel});

  @override
  Widget build(BuildContext context) {
    final vm = viewModel ?? HomeViewModel();
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const StyleHubLogo(size: 30, showText: false),
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
              vm.setBottomNavIndex(2);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Location Bar
              ListenableBuilder(
                listenable: vm,
                builder: (context, _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined, color: Colors.grey, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Send to', style: GoogleFonts.inter(color: Colors.grey, fontSize: 10)),
                              Text(vm.currentLocation, style: GoogleFonts.inter(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final textController = TextEditingController(text: vm.currentLocation);
                                return AlertDialog(
                                  title: Text('Edit Location', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
                                  content: TextField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your location',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel', style: GoogleFonts.inter(color: Colors.grey)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (textController.text.trim().isNotEmpty) {
                                          vm.updateLocation(textController.text.trim());
                                        }
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF8B7355),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text('Save', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8B7355),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            minimumSize: Size.zero,
                          ),
                          child: Text('Change', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Search Bar
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search for styles...',
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Greeting
              Text(
                'Hello, Aakif 👋',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'What are you looking for\ntoday?',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),

              // Categories
              ListenableBuilder(
                listenable: vm,
                builder: (context, _) {
                  return SizedBox(
                    height: 110,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: vm.categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemBuilder: (context, index) {
                        final cat = vm.categories[index];
                        return CategoryItem(
                          title: cat.title,
                          imageUrl: cat.imageUrl,
                          isSelected: vm.selectedCategoryId == cat.id,
                          onTap: () {
                            vm.selectCategory(cat.id);
                            if (cat.id == 'c1') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WomenCollectionView(),
                                ),
                              );
                            } else if (cat.id == 'c2') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MenCollectionView(),
                                ),
                              );
                            } else if (cat.id == 'c3') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const KidsCollectionView(),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Hero Banner
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF1A1C29),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/hero_banner.png',
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't miss out —",
                            style: GoogleFonts.inter(
                              color: const Color(0xFFE8D3B4),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 180,
                            child: Text(
                              'Save up to 50% on your\nfavorite products.',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const EnsembleView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B7355),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: Size.zero,
                            ),
                            child: Text(
                              'Shop Now',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Popular Brand
              Text(
                'Popular Brand',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBrandItem(context, 'H', 'H&M'),
                    const SizedBox(width: 20),
                    _buildBrandItem(context, 'Z', 'Zara'),
                    const SizedBox(width: 20),
                    _buildBrandItem(context, 'L', 'Lacoste'),
                    const SizedBox(width: 20),
                    _buildBrandItem(context, 'R', 'Ralph L'),
                    const SizedBox(width: 20),
                    _buildBrandItem(context, 'P', 'Puma'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // My Space
              _buildSectionHeader(context, 'My Space', showSeeAll: false),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: kMySpacePhotos.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CatalogView()));
                      },
                      child: SizedBox(
                        width: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                kMySpacePhotos[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '\$${45 + (index * 12)}',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Women's Gallery
              _buildSectionHeader(context, "Women's Gallery", showSeeAll: false),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: kWomenCollectionPhotos.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WomenCollectionView()));
                      },
                      child: SizedBox(
                        width: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                kWomenCollectionPhotos[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '\$${59 + (index * 15)}',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Kids' Gallery
              _buildSectionHeader(context, "Kids' Gallery", showSeeAll: false),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: kKidsCollectionPhotos.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const KidsCollectionView()));
                      },
                      child: SizedBox(
                        width: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                kKidsCollectionPhotos[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '\$${30 + (index * 8)}',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Featured Products
              _buildSectionHeader(context, 'Featured Products'),
              const SizedBox(height: 16),
              ListenableBuilder(
                listenable: vm,
                builder: (context, _) {
                  return SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: vm.featuredProducts.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: vm.featuredProducts[index],
                          onFavoriteTap: () =>
                              vm.toggleFavorite(vm.featuredProducts[index].id),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Trending Now
              _buildSectionHeader(context, 'Trending Now'),
              const SizedBox(height: 16),
              ListenableBuilder(
                listenable: vm,
                builder: (context, _) {
                  return Wrap(
                    spacing: 16,
                    runSpacing: 24,
                    children: vm.trendingProducts.map((product) {
                      return SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 48 - 16) / 2,
                        child: ProductCard(
                          product: product,
                          onFavoriteTap: () => vm.toggleFavorite(product.id),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {bool showSeeAll = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (showSeeAll)
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CatalogView()),
              );
            },
            child: Text(
              'SEE ALL',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF8B7355),
                letterSpacing: 0.5,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBrandItem(BuildContext context, String initial, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CatalogView()),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[100],
            child: Text(
              initial,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
