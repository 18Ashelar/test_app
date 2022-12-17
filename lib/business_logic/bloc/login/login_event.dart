part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginCheck extends LoginEvent
{
  final String userName;
  final String password;
  const LoginCheck(this.userName,this.password);
}