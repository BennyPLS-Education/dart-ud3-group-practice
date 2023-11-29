class LoginState {
  final String? _correu;
  final String? _passwd;

  LoginState(this._correu, this._passwd);

  LoginState.initial() : this(null, null);

  String? get getCorreu => _correu;

  String? get getPasswd => _passwd;

  LoginState copyWith({String? correu, String? passwd}) {
    return LoginState(correu ?? _correu, passwd ?? _passwd);
  }
}
