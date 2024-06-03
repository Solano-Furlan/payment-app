import 'package:payment_app/features/mobile_recharge/domain/dtos/mobile_recharge.dto.dart';

abstract class IMobileRechargeRepository {
  Future<void> rechargeMobile({
    required MobileRechargeDto mobileRechargeDto,
  });
}
