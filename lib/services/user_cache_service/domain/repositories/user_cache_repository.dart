import 'package:riverpod_clean/shared/domain/models/either.dart';
import 'package:riverpod_clean/shared/domain/models/models.dart';
import 'package:riverpod_clean/shared/exceptions/http_exception.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
