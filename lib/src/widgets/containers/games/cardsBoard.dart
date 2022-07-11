import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/helpers/logic/gameCards.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/src/widgets/containers/games/cards.dart';
import 'package:provider/provider.dart';

//! Juegos
//? Tablero del juego de las cartas
class CardsBoard extends StatefulWidget {
  final FlipCardController flipCardController;

  const CardsBoard({required this.flipCardController});
  @override
  State<CardsBoard> createState() => _CardsBoardState();
}

class _CardsBoardState extends State<CardsBoard> {
  CardLogic cardLogic = CardLogic();
  FlipCardController flipCardController = FlipCardController();
  @override
  void initState() {
    super.initState();
    cardLogic.initGame();
    flipCardController = widget.flipCardController;
  }

  @override
  Widget build(BuildContext context) {
    final GameCardSettingsService gameCardSettingsService =
        Provider.of<GameCardSettingsService>(context);
    double screenWidht = MediaQuery.of(context).size.width;

    //gameCardSettingsService.startGame();
    double heightCard = (screenWidht * 1.15) * 0.33;
    return SizedBox(
      height: (screenWidht * 1.25),
      width: screenWidht,
      child: GridView.builder(
        itemCount: cardLogic.cardCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: heightCard,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return Cards(
            imageCards: cardLogic.cardsImg[index],
            flipCardController: flipCardController,
          );
        },
      ),
    );
  }
}
