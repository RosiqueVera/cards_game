import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';

AwesomeDialog gameOverDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    dialogType: DialogType.ERROR,
    body: Column(
      children: [
        Container(
          height: 180,
          width: 150,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(crediCoins),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(2, 3),
                  color: Colors.black54,
                )
              ]),
        ),
        const ListTile(
          title: Text(
            'El juego terminó',
            style: TextStyle(
              color: blackGray,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Ya no cuentas con intentos para jugar o CrediPuntos para canjear por intentos de juego',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    btnOkText: 'Salir',
    btnOkColor: Colors.deepOrange,
    btnOkOnPress: () => Navigator.pop(context),
  );
}
