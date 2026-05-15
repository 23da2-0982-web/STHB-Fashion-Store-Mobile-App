import 'package:flutter/material.dart';

enum PaymentMethod { creditCard, visa, cashOnDelivery }

class CheckoutViewModel extends ChangeNotifier {
  int currentStep = 0;
  PaymentMethod selectedPaymentMethod = PaymentMethod.visa;

  // Form Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final apartmentController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();

  void setStep(int step) {
    currentStep = step;
    notifyListeners();
  }

  void setPaymentMethod(PaymentMethod method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    apartmentController.dispose();
    cityController.dispose();
    zipController.dispose();
    super.dispose();
  }
}
