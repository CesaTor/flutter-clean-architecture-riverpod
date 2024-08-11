import 'package:riverpod_clean/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:riverpod_clean/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:riverpod_clean/features/authentication/domain/repositories/auth_repository.dart';
import 'package:riverpod_clean/shared/domain/models/either.dart';
import 'package:riverpod_clean/shared/domain/models/models.dart';
import 'package:riverpod_clean/shared/exceptions/http_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/dummy_data.dart';

void main() {
  late LoginUserDataSource mockLoginUserDataSource;
  late AuthenticationRepository authenticationRepository;
  setUpAll(
    () {
      registerFallbackValue(ktestUser);
      mockLoginUserDataSource = MockLoginUserDataSource();
      authenticationRepository =
          AuthenticationRepositoryImpl(mockLoginUserDataSource);
    },
  );
  group(
    'Authentication Repository Test\n',
    () {
      test(
        'login user should return User when the login is successful',
        () async {
          when(
            () => mockLoginUserDataSource.loginUser(user: any(named: 'user')),
          ).thenAnswer(
            (_) async => Right<AppException, User>(ktestUser),
          );

          final response =
              await authenticationRepository.loginUser(user: ktestUser);

          expect(response.isRight(), true);
        },
      );
      test(
        'login user should return AppException on Login failure',
        () async {
          when(
            () => mockLoginUserDataSource.loginUser(user: any(named: 'user')),
          ).thenAnswer(
            (_) async => Left<AppException, User>(ktestAppException),
          );

          final response =
              await authenticationRepository.loginUser(user: ktestUser);

          expect(response.isLeft(), true);
        },
      );
    },
  );
}

class MockLoginUserDataSource extends Mock implements LoginUserDataSource {}
