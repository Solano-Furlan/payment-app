import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';
import 'package:payment_app/core/helpers/date.helper.dart';
import 'package:payment_app/features/mobile_recharge/data/mobile_recharge.repository.dart';
import 'package:payment_app/features/mobile_recharge/domain/dtos/mobile_recharge.dto.dart';
import 'package:payment_app/features/mobile_recharge/domain/events/mobile_recharge.events.dart';
import 'package:payment_app/features/mobile_recharge/state/mobile_recharge/mobile_recharge.state.dart';
import 'package:payment_app/features/user/domain/events/user.events.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';

class MobileRechargeCubit extends Cubit<MobileRechargeState> {
  MobileRechargeCubit({
    required this.mobileRechargeRepository,
    required this.eventBus,
  }) : super(MobileRechargeInitialState());

  final MobileRechargeRepository mobileRechargeRepository;
  final EventBus eventBus;

  Future<MobileRechargeState> rechargeMobile({
    required MobileRechargeDto mobileRechargeDto,
  }) async {
    try {
      emit(MobileRechargeLoadingState());

      if (mobileRechargeDto.currentUserBalance - mobileRechargeDto.amount < 0) {
        emit(MobileRechargeBalanceErrorState());
        return state;
      }

      if (_monthlyLimitReached(mobileRechargeDto: mobileRechargeDto)) {
        emit(MobileRechargeMonthlyLimitErrorState());
        return state;
      }

      if (_beneficiaryLimitReached(mobileRechargeDto: mobileRechargeDto)) {
        emit(MobileRechargeBeneficiaryLimitErrorState());
        return state;
      }

      eventBus.fire(
        UserBalanceUpdatedEvent(
          balance:
              mobileRechargeDto.currentUserBalance - mobileRechargeDto.amount,
        ),
      );

      await mobileRechargeRepository.rechargeMobile(
        mobileRechargeDto: mobileRechargeDto,
      );

      eventBus.fire(
        MobileRechargeCreatedEvent(
          rechargeInfo: RechargeInfo(
            beneficiary: mobileRechargeDto.beneficiary,
            amount: mobileRechargeDto.amount,
            date: DateTime.now(),
          ),
        ),
      );

      emit(MobileRechargeSuccessState());
      return state;
    } catch (e) {
      eventBus.fire(
        UserBalanceUpdatedEvent(
          balance: mobileRechargeDto.currentUserBalance,
        ),
      );
      emit(MobileRechargeErrorState());
      return state;
    }
  }

  bool _beneficiaryLimitReached({
    required MobileRechargeDto mobileRechargeDto,
  }) {
    final List<RechargeInfo> monthRechargeInfos =
        mobileRechargeDto.rechargeInfos
            .where(
              (e) =>
                  DateHelper.isSameMonthAndYear(
                    date1: e.date,
                    date2: DateTime.now(),
                  ) &&
                  e.beneficiary.id == mobileRechargeDto.beneficiary.id,
            )
            .toList();

    double monthlyBeneficiaryAmount = 0;

    for (final RechargeInfo monthRechargeInfo in monthRechargeInfos) {
      monthlyBeneficiaryAmount += monthRechargeInfo.amount;
    }

    final double monthlyBeneficiaryLimit =
        mobileRechargeDto.isUserVerified ? 500 : 1000;

    if (monthlyBeneficiaryAmount + mobileRechargeDto.amount >
        monthlyBeneficiaryLimit) {
      return true;
    }
    return false;
  }

  bool _monthlyLimitReached({
    required MobileRechargeDto mobileRechargeDto,
  }) {
    final List<RechargeInfo> monthlyRechargeInfos =
        mobileRechargeDto.rechargeInfos
            .where(
              (e) => DateHelper.isSameMonthAndYear(
                date1: e.date,
                date2: DateTime.now(),
              ),
            )
            .toList();

    double monthlyAmount = 0;

    for (final RechargeInfo monthRechargeInfo in monthlyRechargeInfos) {
      monthlyAmount += monthRechargeInfo.amount;
    }

    if (monthlyAmount + mobileRechargeDto.amount > 3000) {
      return true;
    }
    return false;
  }
}
