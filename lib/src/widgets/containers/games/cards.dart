import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/helpers/logic/gameCards.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/widgets/dialogs/looserDialog.dart';
import 'package:memory_game/src/widgets/dialogs/winnerDialog.dart';

//! Juego de cartas
//? Cartas para el tablero
class Cards extends StatefulWidget {
  final String imageCards;

  const Cards({required this.imageCards});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    final CardLogic cardLogic = CardLogic();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          if (status) {
            (cardLogic.isWinner(widget.imageCards))
                ? winnerDialog(context).show()
                : looserDialog(context, widget.imageCards).show();
            setState(() {});
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
                color: Colors.black54,
                offset: Offset(3, 3),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(backCard),
              fit: BoxFit.fill,
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
                color: Colors.black54,
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
