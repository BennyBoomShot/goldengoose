import '../../data/repositories/product_repository.dart';
import '../entities/product.dart';

class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository);

  Future<void> call(Product product) async {
    await repository.update(product);
  }
} 