import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/business.dart';

class BusinessService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Creates a new business in Firestore.
  Future<void> createBusiness(Business business) async {
    await _firestore.collection('businesses').doc(business.id).set(business.toJson());
  }

  /// Gets a business by ID.
  Future<Business?> getBusiness(String businessId) async {
    final doc = await _firestore.collection('businesses').doc(businessId).get();
    if (!doc.exists) return null;
    return Business.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Updates a business in Firestore.
  Future<void> updateBusiness(Business business) async {
    await _firestore.collection('businesses').doc(business.id).update(business.toJson());
  }

  /// Deletes a business from Firestore.
  Future<void> deleteBusiness(String businessId) async {
    await _firestore.collection('businesses').doc(businessId).delete();
  }

  /// Lists businesses, optionally filtered by category or search query.
  Future<List<Business>> listBusinesses({String? category, String? search}) async {
    Query query = _firestore.collection('businesses');
    if (category != null) {
      query = query.where('categories', arrayContains: category);
    }
    if (search != null && search.isNotEmpty) {
      // Simple search by name (case-insensitive)
      query = query.where('searchKeywords', arrayContains: search.toLowerCase());
    }
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => Business.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  /// Adds a staff member to a business with a role.
  Future<void> addStaff(String businessId, String userId, String role) async {
    await _firestore.collection('businesses').doc(businessId).collection('staff').doc(userId).set({'role': role});
  }

  /// Removes a staff member from a business.
  Future<void> removeStaff(String businessId, String userId) async {
    await _firestore.collection('businesses').doc(businessId).collection('staff').doc(userId).delete();
  }

  /// Sets categories for a business.
  Future<void> setCategories(String businessId, List<String> categories) async {
    await _firestore.collection('businesses').doc(businessId).update({'categories': categories});
  }

  /// Sets tags for a business.
  Future<void> setTags(String businessId, List<String> tags) async {
    await _firestore.collection('businesses').doc(businessId).update({'tags': tags});
  }

  /// Sets availability (open/closed) and optionally hours for a business.
  Future<void> setAvailability(String businessId, bool isOpen, {String? hours}) async {
    final Map<String, dynamic> data = {'isOpen': isOpen};
    if (hours != null) data['hours'] = hours;
    await _firestore.collection('businesses').doc(businessId).update(data);
  }

  /// Increments the business's view count.
  Future<void> incrementBusinessView(String businessId) async {
    await _firestore.collection('businesses').doc(businessId).update({'views': FieldValue.increment(1)});
  }

  /// Increments the business's sales count.
  Future<void> incrementBusinessSales(String businessId, int quantity) async {
    await _firestore.collection('businesses').doc(businessId).update({'sales': FieldValue.increment(quantity)});
  }

  /// Adds a review to a business and updates average rating.
  Future<void> addReview(String businessId, String userId, String review, int rating) async {
    final ref = _firestore.collection('businesses').doc(businessId).collection('reviews');
    await ref.add({
      'userId': userId,
      'review': review,
      'rating': rating,
      'timestamp': DateTime.now().toIso8601String(),
    });
    await updateAverageRating(businessId);
  }

  /// Gets all reviews for a business.
  Future<List<Map<String, dynamic>>> getReviews(String businessId) async {
    final snapshot = await _firestore.collection('businesses').doc(businessId).collection('reviews').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Updates the average rating for a business.
  Future<void> updateAverageRating(String businessId) async {
    final reviews = await getReviews(businessId);
    if (reviews.isEmpty) return;
    final avg = reviews.map((r) => r['rating'] as int).reduce((a, b) => a + b) / reviews.length;
    await _firestore.collection('businesses').doc(businessId).update({'averageRating': avg});
  }
} 