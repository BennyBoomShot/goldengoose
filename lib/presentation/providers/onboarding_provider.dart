import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, bool>(
  (ref) => OnboardingNotifier(),
);

class OnboardingNotifier extends StateNotifier<bool> {
  static const _onboardingKey = 'onboarding_complete';

  OnboardingNotifier() : super(false) {
    _loadOnboarding();
  }

  Future<void> _loadOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_onboardingKey) ?? false;
  }

  Future<void> completeOnboarding() async {
    state = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }
} 