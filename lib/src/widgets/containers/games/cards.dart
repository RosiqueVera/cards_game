import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/helpers/logic/gameCards.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/widgets/bottomSheet.dart';
import 'package:memory_game/src/widgets/dialogs/winnerDialog.dart';
import 'package:provider/provider.dart';

//! Juego de cartas
//? Cartas para el tablero
class Cards extends StatefulWidget {
  final String imageCards;
  final FlipCardController flipCardController;

  const Cards({required this.imageCards, required this.flipCardController});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  FlipCardController _flipCardController = FlipCardController();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    _flipCardController = widget.flipCardController;
  }

  @override
  Widget build(BuildContext context) {
    final CardLogic cardLogic = CardLogic();
    final GameCardSettingsService gameCardSettingsService =
        Provider.of<GameCardSettingsService>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FlipCard(
        key: cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        controller: _flipCardController,
        onFlip: () {
          log(_flipCardController.state.toString());
        },
        onFlipDone: (status) {
          if (!gameCardSettingsService.isFinish) {
            if (status) {
              (cardLogic.isWinner(widget.imageCards))
                  ? {
                      winnerDialog(context).show(),
                      gameCardSettingsService.resetIntents(),
                    }
                  : {
                      gameCardSettingsService.addIntent(),
                      bottomSheet(context, _flipCardController),
                    };
            }
          }
        },
        front: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(3, 3),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(backCard),
              fit: BoxFit.fill,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(crediGames),
              height: 50,
              color: Color.fromRGBO(78, 43, 98, 1),
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(3, 3),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(widget.imageCards),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
