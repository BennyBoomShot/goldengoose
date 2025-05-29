import '../../data/repositories/product_repository.dart';
import '../entities/product.dart';

class AddProduct {
  final ProductRepository repository;
  AddProduct(this.repository);

  Future<void> call(Product product) async {
    await repository.create(product);
  }
} 