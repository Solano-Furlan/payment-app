import 'package:go_router/go_router.dart';
import 'package:payment_app/core/navigation/routes/authentication.routes.dart';

class AppRoutesService {
  AppRoutesService._();

  static List<RouteBase> appRoutes = [
    ...AuthenticationRoutes.routes,
  ];
}
