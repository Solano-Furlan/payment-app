import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_app/features/user/data/repositories/user.repository.dart';

@module
abstract class UserModule {
  @lazySingleton
  UserRepository userRepository(
    Dio httpClient,
  ) =>
      UserRepository(
        httpClient: httpClient,
      );
}
