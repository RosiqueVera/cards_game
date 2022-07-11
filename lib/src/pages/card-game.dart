import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:memory_game/src/widgets/containers/games/cardsBoard.dart';
import 'package:memory_game/src/widgets/containers/pointsAndIntents.dart';
import 'package:memory_game/src/widgets/dialogs/confirmActionDialog.dart';
import 'package:provider/provider.dart';

// TODO: Pagina principal
//! Juegos
//? Cartas, encuentra a la sol dorada
class CardsGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameCardSettingsService gameCardSettingsService =
        Provider.of<GameCardSettingsService>(context);
    final GamesService gamesService = Provider.of<GamesService>(context);
    final FlipCardController cardController = FlipCardController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => confirmActionDialog(
            context: context,
            success: () {
              Navigator.of(context).pop();
              gameCardSettingsService.resetGame();
            },
            successText: 'Salir',
            cancel: () {},
            cancelText: 'Cancelar',
            title: '¿Estás seguro de salir de este intento?',
            desc: 'Si dejas el intento no recuperarás este intento de juego',
          ).show(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          iconSize: 30,
        ),
        title: Text(
          !gameCardSettingsService.isFinish
              ? 'Encuentra a Sol'
              : 'Voltea las cartas',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          gameCardSettingsService.isFinish
              ? IconButton(
                  onPressed: () => confirmActionDialog(
                    context: context,
                    success: () {
                      gameCardSettingsService.resetGame();
                      gamesService.playNextIntent(1);
                      Navigator.of(context).pushReplacementNamed('cardsGame');
                    },
                    successText: 'Nuevo juego',
                    cancel: () => Navigator.of(context).pop(),
                    cancelText: 'Salir',
                    title: 'Nuevo juego',
                    desc:
                        'Estas a punto de empezar un juego nuevo, si no cuentas con un intento disponible, se descontará lo equivalente de tus puntos.',
                  ).show(),
                  icon: const Icon(Icons.replay_circle_filled_outlined),
                  iconSize: 30,
                  splashRadius: 20,
                  splashColor: const Color.fromRGBO(255, 216, 215, 1),
                )
              : Container(),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntentsAndPoints(
                  primaryColor: blackGray,
                  secondaryColor: Colors.grey.shade700,
                ),
                CardsBoard(
                  flipCardController: cardController,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage(coup), width: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              '${gameCardSettingsService.cardGameSettings.comments}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: sourceSansBlack,
                              ),
                            ),
                            Text(
                              '${gameCardSettingsService.cardGameSettings.value} CrediPuntos',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: sourceSansBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Image(image: AssetImage(coup), width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
