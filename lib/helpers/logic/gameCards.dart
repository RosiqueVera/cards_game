import 'dart:math';

import 'package:memory_game/constants/listImagesCards.dart';
import 'package:memory_game/src/styles/assetImages.dart';

//! Lógica del juego
//? Declaración de la clase que contiene toda la lógica para el juego de las cartas
class CardLogic {
  final String hiddenCard = backCard;
  List<String> cardsImg = [];
  final int cardCount = listImagesCards.length;
  List<String> baseList = listImagesCards.toList();

//? Método para inicializar el juego
  void initGame() {
    fillList();
  }

//?Método para generar la lista de cartas de forma aleatoria para cada intento de juego
  fillList() {
    for (int i = 0; i < cardCount; i++) {
      int random = Random().nextInt(baseList.length);
      cardsImg.add(
        baseList[random],
      );
      baseList.remove(baseList[random]);
    }
  }

  //? Método para determinar si ganó o no
  bool isWinner(String img) {
    return img == winner;
  }
}
