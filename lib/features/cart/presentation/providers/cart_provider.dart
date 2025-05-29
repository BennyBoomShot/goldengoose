import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../data/repositories/cart_repository.dart';
import '../../domain/entities/cart.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) {
  final dataSource = FirebaseDataSource();
  // Optionally, call initialize() somewhere in your app startup
  return dataSource;
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return CartRepository(firebaseDataSource: firebaseDataSource);
});

class CartNotifier extends StateNotifier<AsyncValue<Cart?>> {
  final CartRepository repository;
  final String userId;

  CartNotifier({required this.repository, required this.userId}) : super(const AsyncValue.loading()) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = const AsyncValue.loading();
    try {
      final cart = await repository.get(userId);
      state = AsyncValue.data(cart);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addItem(CartItem item) async {
    final current = state.value;
    if (current == null) return;
    final updated = current.copyWith(
      items: [...current.items, item],
      totalAmount: current.totalAmount + item.price * item.quantity,
      updatedAt: DateTime.now(),
    );
    await repository.update(updated);
    await loadCart();
  }

  Future<void> updateItem(CartItem item) async {
    final current = state.value;
    if (current == null) return;
    final items = current.items.map((i) => i.id == item.id ? item : i).toList();
    final totalAmount = items.fold<double>(0, (sum, i) => sum + i.price * i.quantity);
    final updated = current.copyWith(
      items: items,
      totalAmount: totalAmount,
      updatedAt: DateTime.now(),
    );
    await repository.update(updated);
    await loadCart();
  }

  Future<void> removeItem(String itemId) async {
    final current = state.value;
    if (current == null) return;
    final items = current.items.where((i) => i.id != itemId).toList();
    final totalAmount = items.fold<double>(0, (sum, i) => sum + i.price * i.quantity);
    final updated = current.copyWith(
      items: items,
      totalAmount: totalAmount,
      updatedAt: DateTime.now(),
    );
    await repository.update(updated);
    await loadCart();
  }

  Future<void> clearCart() async {
    final current = state.value;
    if (current == null) return;
    final updated = current.copyWith(
      items: [],
      totalAmount: 0,
      updatedAt: DateTime.now(),
    );
    await repository.update(updated);
    await loadCart();
  }
}

final cartProvider = StateNotifierProvider.family<CartNotifier, AsyncValue<Cart?>, String>((ref, userId) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartNotifier(repository: repository, userId: userId);
}); 