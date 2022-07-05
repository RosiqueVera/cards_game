import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/convertDialog.dart';
import 'package:provider/provider.dart';

//!Dialogo
//? Dialogo para ver los detalles de los credipuntos y los intentos disponibles
AwesomeDialog crediPointsDetailDialog(BuildContext context) {
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Title(
          color: Colors.deepPurple.shade900,
          child: const Text('Detalles'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: ListTile(
                  title: Text(
                    '${gamesService.customer.intents}',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'Inentos',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                child: ListTile(
                  title: Text(
                    '${gamesService.customer.points}',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'CrediPuntos',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
    btnCancelColor: Colors.blueGrey.shade900,
    btnCancelText: 'Convertir',
    btnCancelOnPress: () => convertPointsDialog(context).show(),
    btnOkText: 'Entendido',
    btnOkOnPress: () => null,
  );
}
