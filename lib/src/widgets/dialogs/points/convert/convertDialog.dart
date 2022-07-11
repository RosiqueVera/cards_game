import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/confirmActionDialog.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/pointsToConvertDialog.dart';
import 'package:provider/provider.dart';

AwesomeDialog convertPointsDialog(BuildContext context) {
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  final GameCardSettingsService gameCardSettingsService =
      Provider.of<GameCardSettingsService>(context, listen: false);
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO_REVERSED,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    body: Column(
      children: [
        Container(
          height: 180,
          width: 170,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(convertPoints),
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
        const Text(
          'Convertir puntos',
          style: TextStyle(
            color: blackGray,
          ),
          textAlign: TextAlign.center,
        ),
        PointsToConvert(),
      ],
    ),
    btnOkText: 'Aceptar',
    btnOkOnPress: () => gamesService.customer.pointsToConvert != null
        ? confirmActionDialog(
            context: context,
            success: () {
              gamesService.convertPoints();
            },
            successText: 'Convertir',
            cancel: () => gamesService.cleanPointsToConvert(),
            cancelText: 'Cancelar',
            title:
                '¿Estás seguro de convertir ${gamesService.customer.pointsToConvert} CrediPuntos a intentos de juego?',
          ).show()
        : convertPointsDialog(context).show(),
    btnCancelText: 'Cancelar',
    btnCancelOnPress: () {
      gameCardSettingsService.resetIntents();
    },
  );
}
