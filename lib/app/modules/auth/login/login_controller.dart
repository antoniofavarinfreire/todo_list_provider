import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';

import '../../../core/ui/notifier/default_change_notifier.dart';
import '../../../services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;

  LoginController({required UserService userService})
      : _userService = userService;

  Future<void> login(String username, String password) async {
    try {
      showLoadingAndResetState();
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
}
