import 'package:group_practice/states/states.dart';

abstract class LoginEvents {
  LoginEvents();
}

class LoginEvent extends LoginEvents {
  final LoginState state;

  LoginEvent(this.state);
}
