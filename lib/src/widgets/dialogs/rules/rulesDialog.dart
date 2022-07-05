//! Dialog
//?Dialogo para mostrar las reglas al usuario acerca de lo que consisten los juegos

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/rules/tableOfRules.dart';

AwesomeDialog rulesDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    btnCancelColor: cherryRed,
    btnCancelText: 'Cerrar',
    btnCancelOnPress: () => null,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Las reglas',
            style: TextStyle(fontSize: 20, color: Colors.deepPurple.shade900),
          ),
        ),
        TableOfRulesOnTheGames(),
      ],
    ),
  );
}
