import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/features/mobile_recharge/presentation/screens/mobile_recharge.screen.dart';

class MobileRechargeRoutes {
  MobileRechargeRoutes._();

  static const String paymentsRoute = '/mobile-recharge';

  static List<RouteBase> routes = [
    GoRoute(
      path: paymentsRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: MobileRechargeScreen(),
        );
      },
    ),
  ];
}
