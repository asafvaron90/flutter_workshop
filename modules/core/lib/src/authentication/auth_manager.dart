import 'package:core/core.dart';

class AuthManager {
  final AuthRepository authRepository;
  AuthManager({required this.authRepository});

  AuthState authState = AuthState.none;
  // default for starting the app
  bool isBiometricRequired = true;

  Future<AuthManager> init() async {
    await _checkAuthState();
    return this;
  }

  _checkAuthState() async {
    final isLoggedIn = authRepository.isLoggedIn();
    if (!isLoggedIn) {
      authState = AuthState.loginRequired;
      return;
    }

    if (isBiometricRequired) {
      authState = AuthState.biometricRequired;
      return;
    }

    authState = AuthState.authenticated;
  }

  Future<bool> login() async {
    final isLoggedIn = await authRepository.loginMock();
    await _checkAuthState();
    return isLoggedIn;
  }

  Future<bool> logout() async {
    final isLoggedOut = await authRepository.logoutMock();
    await _checkAuthState();
    return isLoggedOut;
  }
}
