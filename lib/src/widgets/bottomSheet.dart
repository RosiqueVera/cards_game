import 'package:animated_button/animated_button.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:memory_game/src/widgets/dialogs/gameOver.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/convertDialog.dart';
import 'package:memory_game/src/widgets/dialogs/points/nexIntent.dart';
import 'package:provider/provider.dart';

bottomSheet(
  BuildContext context,
  FlipCardController controller,
) {
  final GameCardSettingsService gameCardSettingsService =
      Provider.of<GameCardSettingsService>(context, listen: false);
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  int intentsToNexOpportunity =
      (gameCardSettingsService.cardGameSettings.intents) + 1;
  return showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext cxt) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage(bannerFirstGame),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 216, 215, 1),
                    Color.fromRGBO(163, 124, 181, 1),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    title: const Text(
                      '¡Perdiste!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: sourceSansBlack,
                      ),
                    ),
                    subtitle: Text(
                      'Puedes volver a intentarlo por $intentsToNexOpportunity intentos',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: sourceSansBlack,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(cxt).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedButton(
                          color: Colors.white,
                          height: 45,
                          width: MediaQuery.of(cxt).size.width * 0.4,
                          onPressed: () {
                            gameCardSettingsService.finishGame(controller);
                            Navigator.of(cxt).pop();
                            controller.toggleCard();
                          },
                          child: const Text(
                            'terminar juego',
                            style: TextStyle(
                              fontFamily: archivoBlack,
                              color: cherryRed,
                            ),
                          ),
                        ),
                        AnimatedButton(
                          color: Colors.purple.shade400,
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.4,
                          onPressed: () {
                            Navigator.of(cxt).pop();
                            (gamesService.customer.intents! >= 0 &&
                                    gamesService.customer.intents! >=
                                        intentsToNexOpportunity)
                                ? {
                                    gamesService.playGame(
                                        gameCardSettingsService
                                            .cardGameSettings.intents),
                                  }
                                : (gamesService.customer.points! >=
                                            gamesService
                                                .customer.pointsPerGame! &&
                                        (gamesService.customer.points! /
                                                gamesService
                                                    .customer.pointsPerGame!) >=
                                            intentsToNexOpportunity)
                                    ? nextIntentDialog(
                                        context,
                                        intentsToNexOpportunity,
                                        controller,
                                      ).show()
                                    : gameOverDialog(context).show();
                          },
                          child: const Text(
                            'Seguir jugando',
                            style: TextStyle(
                              fontFamily: archivoBlack,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}
