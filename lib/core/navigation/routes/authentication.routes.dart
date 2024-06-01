import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/features/authentication/data/authentication.repository.dart';
import 'package:payment_app/features/authentication/presentation/screens/login.screen.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static const String loginRoute = '/';

  static List<RouteBase> routes = [
    GoRoute(
      path: loginRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
          child: BlocProvider<AuthenticationCubit>(
            create: (BuildContext context) => AuthenticationCubit(
              authenticationRepository: getIt<AuthenticationRepository>(),
            ),
            child: const LoginScreen(),
          ),
        );
      },
    ),
  ];
}
