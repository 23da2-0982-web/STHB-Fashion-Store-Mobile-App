import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylehub_app/utils/app_assets.dart';
import '../../viewmodels/auth/login_viewmodel.dart';
import '../../widgets/style_hub_logo.dart';
import 'create_account_view.dart';
import '../home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
             Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              kAuthBackgroundPhoto,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black54),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              const SizedBox(height: 16),
              const Center(child: StyleHubLogo(size: 80)),
              const SizedBox(height: 32),
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('👋', style: TextStyle(fontSize: 28)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              
              _buildTextField(
                label: 'Email Address',
                icon: Icons.email_outlined,
                hintText: 'Email Address',
                controller: _viewModel.emailController,
              ),
              const SizedBox(height: 20),
              
              _buildTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
                controller: _viewModel.passwordController,
              ),
              const SizedBox(height: 16),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _viewModel.forgotPassword();
                  },
                  child: Text(
                    'FORGOT PASSWORD',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF8B7355),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    _viewModel.login();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF030303),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[200], thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: GoogleFonts.inter(
                        color: Colors.grey[500],
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[200], thickness: 1)),
                ],
              ),
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () {
                    _viewModel.loginWithGoogle();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.google, size: 18, color: Colors.blue),
                  label: Text(
                    'Google',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.9),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to CreateAccountView or pop if already pushed
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountView(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
                      children: const [
                        TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Color(0xFFE8D3B4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String hintText,
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    // Note: the design hides the actual label above the field optionally or uses it 
    // as an implicit header, but based on image it looks like the icon is inline with the hint text and there is no visible top label.
    // Let me build it like the design where there's no static label on top, just an inline prefix.
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: GoogleFonts.inter(fontSize: 15),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.92),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(color: Colors.grey[500], fontSize: 15),
        prefixIcon: Icon(icon, size: 20, color: Colors.grey[700]),
        prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        suffixIcon: isPassword
            ? Icon(Icons.remove_red_eye_outlined, size: 20, color: Colors.grey[500])
            : null,
      ),
    );
  }
}
