import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/customerModel.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/insufficientIntents.dart';
import 'package:provider/provider.dart';

AwesomeDialog looserDialog(BuildContext context, String img) {
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  Customer customer = gamesService.customer;
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
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
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.fill,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(2, 3),
                color: Colors.black45,
              ),
            ],
          ),
        ),
        const Text(
          'Lo sentimos, perdiste',
          style: TextStyle(
            color: blackGray,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Puedes volver a intentarlo',
          style: TextStyle(
            color: blackGray,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    btnOkText: 'Volver a jugar',
    btnOkOnPress: () {
      customer.intents! > 0
          ? gamesService.playGame()
          : insufficientsIntents(context: context, cancelFuntion: null).show();
    },
    btnCancelText: 'Salir',
    btnCancelColor: Colors.blueGrey.shade900,
    btnCancelOnPress: () => Navigator.of(context).pop(),
  );
}
