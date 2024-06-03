import 'package:dio/dio.dart';
import 'package:payment_app/core/helpers/http_adapter.helper.dart';
import 'package:payment_app/features/user/data/normalizers/user.normalizer.dart';
import 'package:payment_app/features/user/domain/interfaces/user.repository.interface.dart';
import 'package:payment_app/features/user/domain/models/user.model.dart';

class UserRepository extends IUserRepository {
  UserRepository({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<User> getUser({
    required String email,
    required String password,
  }) async {
    HttpAdapterHelper.login(
      email: email,
      password: password,
    );

    final Response res = await httpClient.get(
      '/user',
      data: {
        'email': email,
        'password': password,
      },
    );

    return UserNormalizer.userFromMapData(
      data: res.data,
    );
  }
}
