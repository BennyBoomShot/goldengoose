import '../../data/repositories/product_repository.dart';
import '../entities/product.dart';

class ListProducts {
  final ProductRepository repository;
  ListProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAll();
  }
} 