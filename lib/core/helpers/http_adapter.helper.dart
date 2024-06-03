import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/features/user/data/repositories/user.repository.mock_data.dart';

class HttpAdapterHelper {
  HttpAdapterHelper._();

  static final DioAdapter dioAdapter = DioAdapter(
    dio: getIt<Dio>(),
    matcher: const UrlRequestMatcher(),
  );

  static void login({
    required String email,
    required String password,
  }) =>
      dioAdapter.onGet('/user', (server) async {
        final Map<String, dynamic>? userMapData = UserRepositoryMockData
            .usersMapData
            .where((Map<String, dynamic> data) =>
                data['email'] == email && data['password'] == password)
            .toList()
            .firstOrNull;

        if (userMapData == null) {
          throw Exception('User not found');
        }

        server.reply(
          200,
          userMapData,
        );
      });

  static void rechargeMobile() =>
      dioAdapter.onGet('/recharche-phone', (server) async {
        server.reply(
          200,
          {},
        );
      });
}
