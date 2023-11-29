import 'package:bloc/bloc.dart';
import 'package:group_practice/events/login_events.dart';
import 'package:group_practice/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEvent) {
      yield event.state;
    }
  }
}
