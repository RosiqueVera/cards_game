import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:provider/provider.dart';

class SliderConvertPoints extends StatefulWidget {
  SliderConvertPoints({Key? key}) : super(key: key);

  @override
  State<SliderConvertPoints> createState() => _SliderConvertPointsState();
}

class _SliderConvertPointsState extends State<SliderConvertPoints> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);
    return Slider(
      value: _currentSliderValue,
      max: gamesService.customer.points!.toDouble(),
      divisions: gamesService.customer.points!,
      thumbColor: Colors.indigo,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
      onChangeEnd: (value) {
        gamesService.pointsToConvert(
          value.toInt(),
        );
      },
    );
  }
}
