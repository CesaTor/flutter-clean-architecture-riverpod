import 'package:riverpod_clean/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:riverpod_clean/features/authentication/domain/repositories/auth_repository.dart';
import 'package:riverpod_clean/shared/domain/models/either.dart';
import 'package:riverpod_clean/shared/domain/models/user/user_model.dart';
import 'package:riverpod_clean/shared/exceptions/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) {
    return dataSource.loginUser(user: user);
  }
}
