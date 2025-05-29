import '../../data/repositories/product_repository.dart';
import '../entities/product.dart';

class GetProduct {
  final ProductRepository repository;
  GetProduct(this.repository);

  Future<Product?> call(String productId) async {
    return await repository.get(productId);
  }
} 