import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';

class MobileRechargeDto {
  MobileRechargeDto({
    required this.amount,
    required this.beneficiary,
    required this.currentUserBalance,
  });

  final double amount;
  final Beneficiary beneficiary;
  final double currentUserBalance;
}
