import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';

//! Dialogo - CrediPuntos
//? Dialogo para mostrar al usuario que se realizó correctamente el pago

AwesomeDialog paymentMadeDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: 150,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(solMoney),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(2, 3),
                color: Color.fromARGB(134, 1, 111, 58),
              )
            ],
          ),
        ),
        const Text(
          '¡Pago realizado!',
          style: TextStyle(color: blackGray, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    btnOkText: 'Hecho',
    btnOkOnPress: () => null,
  );
}
