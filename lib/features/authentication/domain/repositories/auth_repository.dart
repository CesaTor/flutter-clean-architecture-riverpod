import 'package:riverpod_clean/shared/domain/models/either.dart';
import 'package:riverpod_clean/shared/domain/models/models.dart';
import 'package:riverpod_clean/shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> loginUser({required User user});
}
