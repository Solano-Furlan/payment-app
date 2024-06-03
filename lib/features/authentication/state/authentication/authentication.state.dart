import 'package:equatable/equatable.dart';
import 'package:payment_app/features/user/domain/models/user.model.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUnauthorizedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthorizedState extends AuthenticationState {
  AuthenticationAuthorizedState({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [
        user,
      ];
}

class AuthenticationErrorState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
