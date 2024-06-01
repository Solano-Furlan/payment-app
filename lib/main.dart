import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/payment.app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const PaymentApp());
}
