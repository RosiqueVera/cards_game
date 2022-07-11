import 'package:flutter/material.dart';

//? Container para mostrar información al usuario
Container informationContainer({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 5.0,
    ),
    height: 60,
    width: 130,
    decoration: BoxDecoration(
      color: Colors.white,
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
