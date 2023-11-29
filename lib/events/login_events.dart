import '../states/login_state.dart';

abstract class LoginEvents {
  LoginEvents();
}

class LoginEvent extends LoginEvents {
  final LoginState state;

  LoginEvent(this.state);
}
