import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../base_remote_data_source.dart';

class StripeDataSource implements BaseRemoteDataSource {
  @override
  Future<void> initialize() async {
    try {
      // Initialize Stripe with your publishable key
      await Stripe.instance.applySettings();
    } catch (e) {
      AppLogger.error('Stripe error', e, StackTrace.current);
      throw AppException.serverError('Failed to initialize Stripe');
    }
  }

  @override
  Future<void> dispose() async {
    // Clean up any Stripe resources if needed
  }
} 