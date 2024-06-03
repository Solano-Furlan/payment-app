import 'package:payment_app/features/user/domain/models/user.model.dart';

abstract class IUserRepository {
  Future<User> getUser({
    required String email,
    required String password,
  });
}
