import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:provider/provider.dart';

AwesomeDialog nextIntentDialog(BuildContext context,
    int intentsToNexOpportunity, FlipCardController controller) {
  final GamesService gamesService = Provider.of<GamesService>(
    context,
    listen: false,
  );
  final GameCardSettingsService gameCardSettingsService =
      Provider.of<GameCardSettingsService>(
    context,
    listen: false,
  );
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    title: 'Intentos insuficientes',
    desc:
        '¿Deseas volverlo a intentar por ${gamesService.customer.pointsPerGame! * intentsToNexOpportunity} puntos?',
    btnOkText: 'Aceptar',
    btnOkOnPress: () {
      gamesService.playNextIntent(intentsToNexOpportunity);
    },
    btnCancelText: 'Terminar juego',
    btnCancelOnPress: () {
      gameCardSettingsService.finishGame(controller);
    },
  );
}
