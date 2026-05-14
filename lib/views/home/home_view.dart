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
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hero_banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SUMMER COLLECTION',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFE8D3B4),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'New\nArrivals —\nUp to 40%\nOff',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
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
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          'SHOP NOW',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        kMySpacePhotos[index],
                        width: 110,
                        fit: BoxFit.cover,
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
}
