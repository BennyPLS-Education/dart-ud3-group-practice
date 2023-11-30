abstract class LoginEvents {
  LoginEvents();
}

class LoginEventRequest extends LoginEvents {
  final String email;
  final String passwd;

  LoginEventRequest(this.email, this.passwd);
}

class LogoutEvent extends LoginEvents {
  LogoutEvent();
}
