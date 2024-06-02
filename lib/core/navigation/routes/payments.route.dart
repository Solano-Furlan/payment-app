import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/features/payments/presentation/screens/payments.screen.dart';

class PaymentsRoutes {
  PaymentsRoutes._();

  static const String paymentsRoute = '/payments';

  static List<RouteBase> routes = [
    GoRoute(
      path: paymentsRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: PaymentsScreen(),
        );
      },
    ),
  ];
}
