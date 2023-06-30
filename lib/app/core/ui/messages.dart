import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) =>
      _showMessage(message, Colors.red, QuickAlertType.error);
  void showInfo(String message) =>
      _showMessage(message, context.primaryColor, QuickAlertType.info);

  void _showMessage(String message, Color colors, QuickAlertType type) {
    QuickAlert.show(
      context: context,
      type: type,
      text: message,
      confirmBtnText: 'Fechar',
      confirmBtnColor: context.primaryColor,
    );
  }
}
