part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginData loginData;
  const LoginSuccess(this.loginData);
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);
}
