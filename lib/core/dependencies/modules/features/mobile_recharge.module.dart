import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_app/features/mobile_recharge/data/mobile_recharge.repository.dart';

@module
abstract class MobileRechargeModule {
  @lazySingleton
  MobileRechargeRepository mobileRechargeRepository(
    Dio httpClient,
  ) =>
      MobileRechargeRepository(
        httpClient: httpClient,
      );
}
