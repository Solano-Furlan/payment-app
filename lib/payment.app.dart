import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/theme/theme.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';

class PaymentApp extends StatelessWidget {
  const PaymentApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthenticationCubit>(),
      child: MaterialApp.router(
        routerConfig: getIt<GoRouter>(),
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        builder: ((
          BuildContext context,
          Widget? child,
        ) =>
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: child,
            )),
      ),
    );
  }
}
