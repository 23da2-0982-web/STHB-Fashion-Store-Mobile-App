import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylehub_app/utils/app_assets.dart';
import '../auth/login_view.dart';
import '../orders/order_history_view.dart';
import '../placeholders/placeholders.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Profile',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // User Header
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF8B7355), width: 2),
                      image: DecorationImage(
                        image: AssetImage(
                          kUploadedProfilePhotos.isNotEmpty
                              ? kUploadedProfilePhotos.first
                              : kUserProfilePhoto,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Aakif',
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'zeiyadaakif@stylehub.com',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                'EDIT PROFILE',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 36),
            _buildSectionHeader('YOUR UPLOADED PHOTOS'),
            _buildPhotoGallery(),
            const SizedBox(height: 48),
            // Settings Groups
            _buildSectionHeader('ACCOUNT'),
            _buildMenuItem(
              Icons.shopping_bag_outlined, 
              'My Orders', 
              'Track and manage your purchases',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderHistoryView())),
            ),
            _buildMenuItem(
              Icons.favorite_border, 
              'My Wishlist', 
              'Items you have saved for later',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WishlistView())),
            ),
            _buildMenuItem(
              Icons.location_on_outlined, 
              'Shipping Address', 
              'Manage your delivery locations',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddressView())),
            ),
            _buildMenuItem(
              Icons.credit_card_outlined, 
              'Payment Methods', 
              'Manage your cards and wallets',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodsView())),
            ),
            
            const SizedBox(height: 24),
            _buildSectionHeader('PREFERENCES'),
            _buildMenuItem(
              Icons.notifications_none, 
              'Notifications', 
              'App updates and sale alerts',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsView())),
            ),
            _buildMenuItem(
              Icons.language_outlined, 
              'Language', 
              'Change your preferred language',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageView())),
            ),
            _buildMenuItem(
              Icons.dark_mode_outlined, 
              'Display', 
              'Switch between light and dark mode',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DisplaySettingsView())),
            ),
            
            const SizedBox(height: 24),
            _buildSectionHeader('SUPPORT'),
            _buildMenuItem(
              Icons.help_outline, 
              'Help & FAQ', 
              'Find answers to common questions',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpFAQView())),
            ),
            _buildMenuItem(
              Icons.contact_support_outlined, 
              'Contact Us', 
              'Our team is here to help',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactUsView())),
            ),
            _buildMenuItem(
              Icons.info_outline, 
              'About StyleHub', 
              'Our story and sustainability efforts',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutView())),
            ),
            
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginView()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout, color: Color(0xFFC62828)),
                  label: Text(
                    'LOG OUT',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFC62828),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFFFFEBEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      color: Colors.grey[100],
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildPhotoGallery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1,
        children: kUploadedProfilePhotos.map((imagePath) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, size: 20, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}
