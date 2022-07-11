import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/widgets/dialogs/confirmActionDialog.dart';
import 'package:provider/provider.dart';

class SliderConvertPoints extends StatefulWidget {
  const SliderConvertPoints({Key? key}) : super(key: key);

  @override
  State<SliderConvertPoints> createState() => _SliderConvertPointsState();
}

class _SliderConvertPointsState extends State<SliderConvertPoints> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);
    return Column(
      children: [
        Text(
          'Convertir puntos a intentos',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.deepPurple.shade900.withOpacity(0.50),
                offset: const Offset(2, 2),
              )
            ],
          ),
        ),
        Slider(
          value: _currentSliderValue,
          max: gamesService.customer.points! >=
                  gamesService.customer.pointsPerGame!
              ? gamesService.customer.points!.toDouble()
              : 1,
          divisions: gamesService.customer.points! >=
                  gamesService.customer.pointsPerGame!
              ? (gamesService.customer.points! ~/
                  gamesService.customer.pointsPerGame!)
              : 1,
          thumbColor: Colors.deepPurpleAccent,
          activeColor: Colors.deepPurple.shade400,
          inactiveColor: Colors.white10,
          label:
              '${(_currentSliderValue.round() ~/ gamesService.customer.pointsPerGame!)} Intentos',
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
          onChangeEnd: (value) {
            if (value > 0) {
              gamesService.pointsToConvert(
                _currentSliderValue.round(),
              );
              confirmActionDialog(
                context: context,
                success: () {
                  gamesService.convertPoints();
                },
                successText: 'Convertir',
                cancel: () => gamesService.cleanPointsToConvert(),
                cancelText: 'Cancelar',
                title:
                    '¿Estás seguro de convertir ${gamesService.customer.pointsToConvert} CrediPuntos a intentos de juego?',
              ).show().then(
                (value) {
                  setState(
                    () {
                      _currentSliderValue = 0;
                    },
                  );
                },
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${gamesService.customer.pointsPerGame} pts = 1 intento',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Text(
              '${gamesService.customer.points!}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        )
      ],
    );
  }
}
