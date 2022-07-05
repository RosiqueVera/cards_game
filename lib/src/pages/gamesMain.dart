import 'package:flutter/material.dart';
import 'package:memory_game/models/customerModel.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:memory_game/src/widgets/background.dart';
import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:memory_game/src/widgets/containers/pointsAndIntents.dart';
import 'package:provider/provider.dart';

class GamesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      widget: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntentsAndPoints(),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 80),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    speed: Duration(milliseconds: 150),
                    'CREDI - JUEGOS',
                    textStyle: TextStyle(
                      color: Colors.indigo.shade900,
                      fontSize: 32,
                      fontFamily: alfaSlab,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              height: 120,
              child: Image.asset(isotipo, color: blackGray),
            ),
          ),
          const Text(
            'Gana CrediPuntos en diversos juegos',
            style: TextStyle(color: blackGray, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: AnimatedButton(
              child: const Text(
                'Jugar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('home');
              },
              color: const Color.fromARGB(255, 3, 170, 131),
              height: 50,
              width: 190,
              duration: 90,
            ),
          )
        ],
      ),
    );
  }
}
