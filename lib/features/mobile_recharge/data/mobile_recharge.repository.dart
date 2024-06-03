import 'dart:math';

import 'package:dio/dio.dart';
import 'package:payment_app/core/helpers/http_adapter.helper.dart';
import 'package:payment_app/features/mobile_recharge/domain/dtos/mobile_recharge.dto.dart';
import 'package:payment_app/features/mobile_recharge/domain/interfaces/mobile_recharge.repository.interface.dart';

class MobileRechargeRepository extends IMobileRechargeRepository {
  MobileRechargeRepository({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<void> rechargeMobile({
    required MobileRechargeDto mobileRechargeDto,
  }) async {
    HttpAdapterHelper.rechargeMobile();

    await httpClient.post(
      '/recharche-phone',
      data: {
        'beneficiaryId': mobileRechargeDto.beneficiary.id,
        'amount': mobileRechargeDto.amount,
      },
    );

    if (Random().nextInt(4) == 1) {
      throw Exception(
        'Recharge Failed',
      );
    }
  }
}
