import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/authentication/data/authentication.repository.dart';
import 'package:payment_app/features/authentication/domain/dtos/login.dto.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required this.authenticationRepository,
  }) : super(AuthenticationUnauthorizedState());

  final AuthenticationRepository authenticationRepository;

  Future<AuthenticationState> login({
    required LoginDto loginDto,
  }) async {
    try {
      emit(AuthenticationPinLoadingState());

      await authenticationRepository.login(
        loginDto: loginDto,
      );

      emit(AuthenticationAuthorizedState());
      return state;
    } catch (e) {
      emit(AuthenticationErrorState());
      return state;
    }
  }
}
