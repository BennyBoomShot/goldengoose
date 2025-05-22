import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../core/error/app_exception.dart';
import '../base_remote_data_source.dart';

class StripeDataSource implements BaseRemoteDataSource {
  @override
  Future<void> initialize() async {
    try {
      // Initialize Stripe with your publishable key
      await Stripe.instance.applySettings();
    } catch (e) {
      throw AppException.unknown('Failed to initialize Stripe: $e');
    }
  }

  @override
  Future<void> dispose() async {
    // Clean up any Stripe resources if needed
  }
} 