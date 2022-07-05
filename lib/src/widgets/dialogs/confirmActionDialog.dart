import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';

//! Dialogo
//? Dialogo de confirmación de una acción
AwesomeDialog confirmActionDialog(
    {required BuildContext context,
    required dynamic success,
    required String successText,
    Color? successColor,
    required dynamic cancel,
    required String cancelText,
    Color? cancelColor,
    String? title,
    String? desc,
    Widget? body}) {
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      title: title,
      desc: desc,
      body: body,
      btnOkText: successText,
      btnOkColor: successColor,
      btnOkOnPress: success,
      btnCancelText: cancelText,
      btnCancelColor: cancelColor,
      btnCancelOnPress: cancel);
}
