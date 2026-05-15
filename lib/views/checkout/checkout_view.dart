import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../viewmodels/checkout/checkout_viewmodel.dart';
import 'order_success_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final CheckoutViewModel _viewModel = CheckoutViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Stepper Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStep(0, 'ADDRESS', true),
                _buildStepDivider(),
                _buildStep(1, 'PAYMENT', false),
                _buildStepDivider(),
                _buildStep(2, 'CONFIRM', false),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Details',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      _buildTextField(
                        controller: _viewModel.nameController,
                        hint: 'Full Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 24),
                      _buildTextField(
                        controller: _viewModel.phoneController,
                        hint: 'Phone Number',
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 24),
                      _buildTextField(
                        controller: _viewModel.addressController,
                        hint: 'Street Address',
                        icon: Icons.location_on,
                      ),
                      const SizedBox(height: 24),
                      _buildTextField(
                        controller: _viewModel.apartmentController,
                        hint: 'Apartment, Suite, Unit (Optional)',
                        icon: Icons.business,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _viewModel.cityController,
                              hint: 'City',
                              icon: Icons.location_city,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextField(
                              controller: _viewModel.zipController,
                              hint: 'Postal Code',
                              icon: Icons.email,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      // Order Summary Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/hero_banner.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '3 items selected',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$1,240.00',
                                  style: GoogleFonts.playfairDisplay(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: const Color(0xFF8B7355),
                                  ),
                                ),
                                Text(
                                  'VIEW DETAILS',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      Text(
                        'Payment Method',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/19974d243366d94d4f4e5ae177983403.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildPaymentOption(
                        method: PaymentMethod.visa,
                        title: 'Visa Classic',
                        subtitle: '**** **** **** 4242',
                        iconWidget: const FaIcon(FontAwesomeIcons.ccVisa, size: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentOption(
                        method: PaymentMethod.creditCard,
                        title: 'Other Credit or Debit Card',
                        subtitle: 'Mastercard, Amex, etc.',
                        iconWidget: const Icon(Icons.credit_card, size: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentOption(
                        method: PaymentMethod.cashOnDelivery,
                        title: 'Cash on Delivery',
                        subtitle: 'Pay upon receiving items',
                        iconWidget: const Icon(Icons.account_balance_wallet_outlined, size: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
          
          // Bottom Summary Bar
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL AMOUNT',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '\$1,240.00',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const OrderSuccessView()),
                        );
                      },
                      icon: const Icon(Icons.lock, size: 18, color: Colors.white),
                      label: Text(
                        'PLACE ORDER',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF141421),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int index, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF8B7355) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Colors.grey[600],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildStepDivider() {
    return Container(
      width: 30,
      height: 1,
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      style: GoogleFonts.inter(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
        prefixIcon: Icon(icon, color: Colors.grey[600], size: 20),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildPaymentOption({
    required PaymentMethod method,
    required String title,
    required String subtitle,
    required Widget iconWidget,
  }) {
    bool isSelected = _viewModel.selectedPaymentMethod == method;
    return GestureDetector(
      onTap: () => _viewModel.setPaymentMethod(method),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF816D54) : Colors.grey[200]!,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: iconWidget,
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
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF8B7355) : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF8B7355),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
