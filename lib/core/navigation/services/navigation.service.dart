import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/navigation/routes/authentication.routes.dart';

class AppNavigationService {
  AppNavigationService({
    required this.appRouter,
  });

  final GoRouter appRouter;

  void _routeTo(
    String location,
  ) {
    if (kIsWeb) {
      appRouter.go(location);
    } else {
      appRouter.push(location);
    }
  }

  bool canPop() => appRouter.canPop();

  bool pop() {
    if (canPop()) {
      appRouter.pop(true);
      return true;
    }
    return false;
  }

  void routeToDynamicLocaton({
    required String location,
  }) =>
      appRouter.go(location);

  void routeToLogin() => _routeTo(
        AuthenticationRoutes.loginRoute,
      );
}
