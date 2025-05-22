import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final fontSizeProvider = StateNotifierProvider<FontSizeNotifier, double>(
  (ref) => FontSizeNotifier(),
);

class FontSizeNotifier extends StateNotifier<double> {
  static const _fontSizeKey = 'font_size';

  FontSizeNotifier() : super(16.0) {
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getDouble(_fontSizeKey) ?? 16.0;
  }

  Future<void> setFontSize(double size) async {
    state = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);
  }
} 