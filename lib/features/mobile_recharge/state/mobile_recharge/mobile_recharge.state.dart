import 'package:equatable/equatable.dart';

abstract class MobileRechargeState extends Equatable {}

class MobileRechargeInitialState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeLoadingState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeSuccessState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeBeneficiaryLimitErrorState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeMonthlyLimitErrorState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeBalanceErrorState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}

class MobileRechargeErrorState extends MobileRechargeState {
  @override
  List<Object?> get props => [];
}
