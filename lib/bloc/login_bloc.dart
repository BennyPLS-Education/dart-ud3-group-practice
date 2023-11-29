import 'package:bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/states/states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEventRequest) {
      if (event.correu == "t@t.com" && event.passwd == "admin1234") {
        yield LoginState(event.correu, event.passwd, true);
      } else {
        yield LoginState(event.correu, event.passwd, false);
      }
    }
  }
}
