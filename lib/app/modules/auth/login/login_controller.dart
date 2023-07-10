import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';

import '../../../core/ui/notifier/default_change_notifier.dart';
import '../../../services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
      : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String username, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();

      final user = await _userService.login(username, password);

      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválido');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  void forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = "Reset de senha enviado para seu e-mail";
    } catch (e) {
      if (e is AuthException) {
        setError(e.message);
      } else {
        setError('Erro ao resetar senha');
      }
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
