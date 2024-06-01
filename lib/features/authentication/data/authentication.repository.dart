import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payment_app/features/authentication/domain/dtos/login.dto.dart';
import 'package:payment_app/features/authentication/domain/interfaces/authentication.repository.interface.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  AuthenticationRepository({
    required this.hive,
    required this.localAuthentication,
  });

  final HiveInterface hive;
  final LocalAuthentication localAuthentication;

  @override
  Future<void> login({
    required LoginDto loginDto,
  }) async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    await box.get(
      'auth_pin',
      defaultValue: null,
    );

    await box.close();
  }
}
