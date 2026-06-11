import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/checkout/widgets/order_failure_dialog.dart';
import 'package:food_cafe_user/project/features/checkout/widgets/order_success_dialog.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;
  BuildContext? _paymentContext;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _initializeListeners();
  }

  void _initializeListeners() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    log("Payment Success: ${response.paymentId}");
    if (_paymentContext != null) {
      showDialog(
        context: _paymentContext!,
        builder: (_) => OrderSuccessDialog(
          orderId: response.orderId ?? '',
          paymentId: response.paymentId ?? '',
          paymentMethod: 'RazorPay',
        ),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    log("Payment Error: ${response.code} - ${response.message}");
    if (_paymentContext != null) {
      showDialog(
        context: _paymentContext!,
        builder: (_) => const OrderFailureDialog(),
      );
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet payments here if needed
    log("External Wallet: ${response.walletName}");
  }

  void startPayment({
    required int amount,
    required String phoneNo,
    required BuildContext context,
  }) {
    _paymentContext = context;
    var options = {
      'key': 'rzp_test_SnFbCksF2a5kdQ',
      'amount': amount, // Amount in paisa (e.g., for ₹1000 use 100000)
      'name': 'Payment',
      'description': 'Service Charge',
      'prefill': {'contact': phoneNo, 'email': 'user@example.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      // Handle error
    }
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}
