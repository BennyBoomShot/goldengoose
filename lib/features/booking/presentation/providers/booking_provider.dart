import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../data/repositories/booking_repository.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) {
  final dataSource = FirebaseDataSource();
  // Optionally, call initialize() somewhere in your app startup
  return dataSource;
});

final bookingRepositoryProvider = Provider<IBookingRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return BookingRepository(firebaseDataSource: firebaseDataSource);
});

class BookingListNotifier extends StateNotifier<AsyncValue<List<Booking>>> {
  final IBookingRepository repository;
  final String userId;

  BookingListNotifier({required this.repository, required this.userId}) : super(const AsyncValue.loading()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    state = const AsyncValue.loading();
    try {
      final bookings = await repository.getUserBookings(userId);
      state = AsyncValue.data(bookings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addBooking(Booking booking) async {
    try {
      await repository.createBooking(booking);
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateBooking(Booking booking) async {
    try {
      await repository.updateBooking(booking);
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteBooking(String bookingId) async {
    try {
      await repository.deleteBooking(bookingId);
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final bookingListProvider = StateNotifierProvider.family<BookingListNotifier, AsyncValue<List<Booking>>, String>((ref, userId) {
  final repository = ref.watch(bookingRepositoryProvider);
  return BookingListNotifier(repository: repository, userId: userId);
}); 