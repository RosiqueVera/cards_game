import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/colors.dart';

//? Container para mostrar información al usuario
Container informationContainer({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 5.0,
    ),
    height: 55,
    width: 110,
    decoration: BoxDecoration(
      color: lightYelow,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 5,
          offset: Offset(1, 3.5),
        ),
      ],
    ),
    child: child,
  );
}
