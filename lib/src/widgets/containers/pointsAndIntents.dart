import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/containers/informationCard.dart';
import 'package:memory_game/src/widgets/dialogs/points/convert/convertDialog.dart';
import 'package:provider/provider.dart';

//? Widget para mostrar las cards de los intentos y los puntos del usuario
class IntentsAndPoints extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const IntentsAndPoints(
      {super.key, required this.primaryColor, required this.secondaryColor});
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
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 23,
                ),
              ),
              Text(
                'Puntos',
                style: TextStyle(
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
        informationContainer(
          child: GestureDetector(
            onTap: () => convertPointsDialog(context).show(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gamesService.customer.intents.toString(),
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 23,
                  ),
                ),
                Text(
                  'Intentos',
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
