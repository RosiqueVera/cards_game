import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:provider/provider.dart';

class PointsToConvert extends StatefulWidget {
  const PointsToConvert({Key? key}) : super(key: key);

  @override
  State<PointsToConvert> createState() => _PointsToConvertState();
}

class _PointsToConvertState extends State<PointsToConvert> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);

    return Column(
      children: [
        Slider(
          value: _currentSliderValue,
          max: gamesService.customer.points!.toDouble(),
          divisions: (gamesService.customer.points! ~/
              gamesService.customer.pointsPerGame!),
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
                value.round(),
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '0',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '${gamesService.customer.pointsPerGame} pts = 1 intento',
                style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
              ),
            ),
            Text(
              '${gamesService.customer.points!}',
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ],
        )
      ],
    );
  }
}
