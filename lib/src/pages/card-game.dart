import 'package:flutter/material.dart';
import 'package:memory_game/models/gameSettingsModel.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:memory_game/src/widgets/containers/games/cardsBoard.dart';
import 'package:memory_game/src/widgets/dialogs/confirmActionDialog.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/convertDialog.dart';
import 'package:provider/provider.dart';

// TODO: Pagina principal
//! Juegos
//? Cartas, encuentra a la sol dorada
class CardsGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService =
        Provider.of<GamesService>(context, listen: true);
    GameSettingsModel gameSettingsModel = GameSettingsModel(
      category: 'Juego de cartas',
      comments: 'Encuentra a Sol dorada y gana',
      value: 2,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => confirmActionDialog(
            context: context,
            success: () => Navigator.of(context).pop(),
            successText: 'Salir',
            cancel: () {},
            cancelText: 'Cancelar',
            title: '¿Estás seguro de salir de este intento?',
            desc: 'Si dejas el intento no recuperarás este intento de juego',
          ).show(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
        ),
        title: const Text(
          'Intentos:',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              onTap: () => convertPointsDialog(context).show(),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  '${gamesService.customer.intents}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: alfaSlab,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundCardGame,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardsBoard(),
                Card(
                  borderOnForeground: true,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage(coup), height: 80),
                        Column(
                          children: [
                            Text('${gameSettingsModel.comments}'),
                            Text('${gameSettingsModel.value} CrediPuntos')
                          ],
                        )
                      ],
                    ),
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
