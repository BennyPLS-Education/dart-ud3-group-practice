import 'package:group_practice/states/states.dart';

abstract class LoginEvents {
  LoginEvents();
}

class LoginEventRequest extends LoginEvents {
  final String correu;
  final String passwd;

  LoginEventRequest(this.correu, this.passwd);
}
