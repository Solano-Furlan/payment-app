import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';
import 'package:payment_app/features/mobile_recharge/domain/events/mobile_recharge.events.dart';
import 'package:payment_app/features/user/data/repositories/user.repository.dart';
import 'package:payment_app/features/user/domain/events/user.events.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';
import 'package:payment_app/features/user/domain/models/user.model.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required this.userRepostory,
    required this.eventBus,
  }) : super(AuthenticationUnauthorizedState());

  final UserRepository userRepostory;
  final EventBus eventBus;

  StreamSubscription? _mobileRechargeCreatedEventSubscription;
  StreamSubscription? _userAmountUpdatedEventSubscription;

  Future<void> initialize() async {
    _mobileRechargeCreatedEventSubscription = eventBus
        .on<MobileRechargeCreatedEvent>()
        .listen((MobileRechargeCreatedEvent event) => _updateUserRecharges(
              rechargeInfo: event.rechargeInfo,
            ));

    _userAmountUpdatedEventSubscription = eventBus
        .on<UserBalanceUpdatedEvent>()
        .listen((UserBalanceUpdatedEvent event) => _updateUserBalance(
              balance: event.balance,
            ));
  }

  @override
  Future<void> close() async {
    await _mobileRechargeCreatedEventSubscription?.cancel();
    await _userAmountUpdatedEventSubscription?.cancel();
    return super.close();
  }

  User get user {
    final AuthenticationState authenticationState = state;

    if (authenticationState is AuthenticationAuthorizedState) {
      return authenticationState.user;
    }
    throw Exception('User is not authhorized');
  }

  Future<AuthenticationState> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthenticationLoadingState());

      final User user = await userRepostory.getUser(
        email: email,
        password: password,
      );

      emit(AuthenticationAuthorizedState(
        user: user,
      ));
      return state;
    } catch (e, _) {
      emit(AuthenticationErrorState());
      return state;
    }
  }

  void _updateUserRecharges({
    required RechargeInfo rechargeInfo,
  }) {
    final AuthenticationState currentState = state;
    if (currentState is AuthenticationAuthorizedState) {
      emit(
        AuthenticationAuthorizedState(
          user: currentState.user.copyWith(
            rechargeInfo: rechargeInfo,
          ),
        ),
      );
    }
  }

  void _updateUserBalance({
    required double balance,
  }) {
    final AuthenticationState currentState = state;
    if (currentState is AuthenticationAuthorizedState) {
      emit(
        AuthenticationAuthorizedState(
          user: currentState.user.copyWith(
            balance: balance,
          ),
        ),
      );
    }
  }
}
