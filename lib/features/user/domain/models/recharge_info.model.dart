import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';

class RechargeInfo {
  RechargeInfo({
    required this.date,
    required this.amount,
    required this.beneficiary,
  });

  final DateTime date;
  final double amount;
  final Beneficiary beneficiary;
}
