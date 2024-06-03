import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';

class MobileRechargeDto {
  MobileRechargeDto({
    required this.amount,
    required this.beneficiary,
    required this.currentUserBalance,
    required this.isUserVerified,
    required this.rechargeInfos,
  });

  final double amount;
  final Beneficiary beneficiary;
  final double currentUserBalance;
  final bool isUserVerified;
  final List<RechargeInfo> rechargeInfos;
}
