import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/providers/booking_providers.dart' show firebaseDataSourceProvider;
import '../../data/repositories/product_repository.dart';
import '../../domain/use_cases/add_product.dart';
import '../../domain/use_cases/delete_product.dart';
import '../../domain/use_cases/get_product.dart';
import '../../domain/use_cases/list_products.dart';
import '../../domain/use_cases/update_product.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return ProductRepository(firebaseDataSource: firebaseDataSource);
});

final addProductProvider = Provider<AddProduct>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return AddProduct(repo);
});

final updateProductProvider = Provider<UpdateProduct>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return UpdateProduct(repo);
});

final deleteProductProvider = Provider<DeleteProduct>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return DeleteProduct(repo);
});

final getProductProvider = Provider<GetProduct>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return GetProduct(repo);
});

final listProductsProvider = Provider<ListProducts>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return ListProducts(repo);
}); 