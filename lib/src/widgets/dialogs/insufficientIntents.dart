import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/convertDialog.dart';

//! Dialog
//? Dialogo para mostrar al usuario cuando intenta realizar otro intento de juego pero no tiene más intentos
AwesomeDialog insufficientsIntents(
    {required BuildContext context, required dynamic cancelFuntion}) {
  return AwesomeDialog(
    context: context,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    dialogType: DialogType.ERROR,
    body: Container(
      alignment: Alignment(-0.1, 0.1),
      padding: const EdgeInsets.only(left: 0),
      height: 220,
      width: 230,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(marc),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 3),
            color: Colors.black45,
          ),
        ],
      ),
      child: Text(
        'Intentos\n' 'Insuficientes',
        style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    ),
    btnOkText: 'Convertir CrediPuntos',
    btnOkColor: Colors.amber.shade900,
    btnOkOnPress: () => convertPointsDialog(context).show(),
    btnCancelText: 'Salir',
    btnCancelOnPress: () => cancelFuntion,
  );
}
