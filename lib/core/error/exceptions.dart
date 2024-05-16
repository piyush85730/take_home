class ServerException implements Exception {
  ServerException({required this.error});

  final String error;
}

class CacheException implements Exception {
  CacheException({required this.error});

  final String error;
}