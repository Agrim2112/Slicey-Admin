part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {
}

final class SignInFailure extends SignInState {
}

final class SignInLoading extends SignInState {
}

final class SignInSuccess extends SignInState {
}

final class SignOutSuccess extends SignInState {
}