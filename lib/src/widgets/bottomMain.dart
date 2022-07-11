import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';

//? Widget para mostrar la imagen de fondo del juego
Row bottomMain(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: const Color.fromARGB(117, 68, 36, 122),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Gana CrediPuntos jugando',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 80,
        child: Image.asset(
          isotipo,
          color: Colors.white,
        ),
      ),
    ],
  );
}
