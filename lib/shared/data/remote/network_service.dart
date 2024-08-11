import 'package:riverpod_clean/shared/domain/models/either.dart';
import 'package:riverpod_clean/shared/domain/models/response.dart';
import 'package:riverpod_clean/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
