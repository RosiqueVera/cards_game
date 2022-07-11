import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:memory_game/src/widgets/animtedText.dart';
import 'package:memory_game/src/widgets/background.dart';
import 'package:animated_button/animated_button.dart';
import 'package:memory_game/src/widgets/containers/pointsAndIntents.dart';

class GamesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      widget: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntentsAndPoints(
                primaryColor: Colors.deepPurple,
                secondaryColor: Colors.deepPurple.shade400,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment.center,
            child: animateText(
              text1: 'CREDI',
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Pulse(
              delay: const Duration(seconds: 2),
              duration: const Duration(seconds: 5),
              infinite: true,
              child: AnimatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                color: Colors.deepPurpleAccent,
                height: 40,
                width: 175,
                duration: 90,
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
