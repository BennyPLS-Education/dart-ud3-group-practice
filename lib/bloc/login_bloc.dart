import 'package:bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/states/states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final String _validEmail = "t@t.com";
  final String _validPasswd = "admin1234";

  LoginBloc() : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEventRequest) {
      yield _login(event);
    } else if (event is LogoutEvent) {
      yield LoginState.initial();
    }
  }

  LoginState _login(LoginEventRequest event) {
    if (event.email == _validEmail && event.passwd == _validPasswd) {
      return LoginState(event.email, event.passwd, true);
    } else {
      return LoginState(event.email, event.passwd, false);
    }
  }
}
