abstract class BaseRemoteDataSource {
  Future<void> initialize();
  Future<void> dispose();
} 