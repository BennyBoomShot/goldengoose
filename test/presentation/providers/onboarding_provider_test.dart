import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldengoose/presentation/providers/onboarding_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to onboarding not complete', () async {
      final notifier = OnboardingNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, false);
    });

    test('can set and persist onboarding complete', () async {
      final notifier = OnboardingNotifier();
      await Future.delayed(Duration.zero);
      await notifier.completeOnboarding();
      expect(notifier.state, true);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('onboarding_complete'), true);
    });
  });
} 