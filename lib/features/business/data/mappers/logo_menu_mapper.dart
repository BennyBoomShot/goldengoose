import '../../../../shared/models/logo_detection_result.dart';
import '../../../../shared/models/menu_extraction_result.dart';
import '../../domain/entities/app_logo.dart';
import '../../domain/entities/product.dart';

/// Mapper for converting logo and menu extraction results to domain models.
class LogoMenuMapper {
  /// Converts a [LogoDetectionResult] to an [AppLogo] if successful.
  static AppLogo? toAppLogo(LogoDetectionResult result) {
    if (result.isSuccess && result.imagePath != null) {
      return AppLogo(imagePath: result.imagePath!);
    }
    return null;
  }

  /// Converts a [MenuExtractionResult] to a list of [Product]s if successful.
  static List<Product> toProducts(MenuExtractionResult result) {
    if (result.isSuccess && result.text != null) {
      return parseMenuTextToProducts(result.text!);
    }
    return [];
  }

  /// Parses menu text into a list of [Product]s.
  /// Each line should be in the format: 'Product Name - $Price'
  static List<Product> parseMenuTextToProducts(String menuText) {
    final lines = menuText.split('\n');
    return lines.map((line) {
      final parts = line.split('-');
      final name = parts[0].trim();
      double? price;
      if (parts.length > 1) {
        final priceString = parts[1].replaceAll(RegExp(r'[^0-9.]'), '');
        price = double.tryParse(priceString);
      }
      return Product(name: name, price: price);
    }).where((product) => product.name.isNotEmpty).toList();
  }
} 