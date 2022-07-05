import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:provider/provider.dart';

//! Dialogo
//? Dialogo para mostrar al usuario cuantos CrediPuntos ganó
AwesomeDialog winnerDialog(BuildContext context) {
  final GamesService gamesService = Provider.of<GamesService>(
    context,
    listen: false,
  );
  final GameCardSettingsService cardsSettings =
      Provider.of<GameCardSettingsService>(context, listen: false);
  return AwesomeDialog(
    context: context,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    dialogType: DialogType.SUCCES,
    barrierColor: const Color.fromARGB(149, 255, 236, 179),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: 170,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
            image: const DecorationImage(
              image: AssetImage(winner),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(2, 3),
                color: Colors.amber.shade300,
              ),
            ],
          ),
        ),
        const Text(
          '¡Felicidades Ganaste!',
          style: TextStyle(
            color: blackGray,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    btnOkColor: Colors.amber.shade900,
    btnOkText: 'Obtener recompensa',
    btnOkOnPress: () {
      gamesService.winnerPoints(cardsSettings.cardGameSettings.value!);
      Navigator.of(context).pop();
    },
  );
}
