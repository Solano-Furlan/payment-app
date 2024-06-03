import 'package:injectable/injectable.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/user/data/repositories/user.repository.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  AuthenticationCubit authenticationCubit(
    UserRepository userRepostory,
    EventBus eventBus,
  ) =>
      AuthenticationCubit(
        userRepostory: userRepostory,
        eventBus: eventBus,
      )..initialize();
}
