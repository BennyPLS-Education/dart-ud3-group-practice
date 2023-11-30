class LoginState {
  final String? _correu;
  final String? _passwd;
  final bool? isValid;

  LoginState(this._correu, this._passwd, this.isValid);

  LoginState.initial() : this(null, null, null);

  String? get getEmail => _correu;

  String? get getPasswd => _passwd;

  LoginState copyWith({String? correu, String? passwd, bool? isValid}) {
    return LoginState(correu ?? _correu, passwd ?? _passwd, isValid ?? false);
  }
}
