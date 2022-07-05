import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/containers/informationCard.dart';
import 'package:provider/provider.dart';

//? Widget para mostrar las cards de los intentos y los puntos del usuario
class IntentsAndPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        informationContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gamesService.customer.points.toString(),
                style: const TextStyle(
                  color: red,
                ),
              ),
              const Text(
                'Puntos',
                style: TextStyle(
                  color: red,
                ),
              ),
            ],
          ),
        ),
        informationContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gamesService.customer.intents.toString(),
                style: const TextStyle(
                  color: red,
                ),
              ),
              const Text(
                'Intentos',
                style: TextStyle(
                  color: red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
