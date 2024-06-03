import 'package:equatable/equatable.dart';
import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.balance,
    required this.isVerified,
    required this.beneficiaries,
    required this.rechargeInfos,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final double balance;
  final bool isVerified;
  final List<Beneficiary> beneficiaries;
  final List<RechargeInfo> rechargeInfos;

  User copyWith({
    double? balance,
    RechargeInfo? rechargeInfo,
  }) {
    final List<RechargeInfo> updatedRechargeInfos =
        rechargeInfos.map((e) => e).toList();

    if (rechargeInfo != null) {
      updatedRechargeInfos.insert(0, rechargeInfo);
    }
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      balance: balance ?? this.balance,
      isVerified: isVerified,
      beneficiaries: beneficiaries,
      rechargeInfos: updatedRechargeInfos,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        balance,
        isVerified,
        beneficiaries,
        rechargeInfos,
      ];
}
