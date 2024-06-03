import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';
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
}
