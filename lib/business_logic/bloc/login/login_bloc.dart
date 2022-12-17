import 'package:bloc/bloc.dart';
import 'package:test_app/data/model/login/login_data.dart';
import 'package:test_app/data/repository/login_details_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginDetailsRepository loginDetailsRepository = LoginDetailsRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginCheck>((event, emit) async {
      try {
        emit(LoginLoding());
        
        final loginData = await loginDetailsRepository.getLoginDetails(
            event.userName, event.password);
            await Future.delayed(const Duration(seconds: 3));
        emit(LoginSuccess(loginData));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
