import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/features/authentication/presentation/screens/login.screen.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static const String loginRoute = '/';

  static List<RouteBase> routes = [
    GoRoute(
      path: loginRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: LoginScreen(),
        );
      },
    ),
  ];
}
