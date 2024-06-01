import 'package:payment_app/features/authentication/domain/dtos/login.dto.dart';

abstract class IAuthenticationRepository {
  Future<void> login({
    required LoginDto loginDto,
  });
}
