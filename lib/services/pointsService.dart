import 'package:flutter/material.dart';
import 'package:memory_game/models/customerModel.dart';

//! Servicio de puntos
//? Declaración del servicio
class GamesService with ChangeNotifier {
  Customer? _customer = Customer(
    intents: 5,
    points: 105,
    pointsPerGame: 5,
    pay: 100,
  );

  //?  Método para obtener al cliente
  Customer get customer => _customer!;

  //?Método para ver si es posible pagar con puntos
  bool get isPossiblepaymentWithPoints => _customer!.points! >= _customer!.pay!;

  //? Método para asignar un cliente
  set customer(Customer customer) {
    _customer = customer;
    notifyListeners();
  }

  //? Asignación de los puntos a convertir
  void pointsToConvert(int points) {
    _customer?.pointsToConvert = points;
    notifyListeners();
  }

  //? Método para volver a 0 los puntos a convertir
  void cleanPointsToConvert() {
    _customer?.pointsToConvert = 0;
    notifyListeners();
  }

  //? Método para convertir puntos a intentos de juegos
  void convertPoints() {
    int pointsToConvert =
        _customer!.pointsToConvert! ~/ _customer!.pointsPerGame!;
    _customer?.intents = _customer!.intents! + pointsToConvert;
    _customer?.points = (_customer!.points! - _customer!.pointsToConvert!);
    _customer?.pointsToConvert = 0;
    notifyListeners();
  }

  //? Método para  asignar los puntos ganados en el juego
  void winnerPoints(int points) {
    _customer?.points = _customer!.points! + points;
    notifyListeners();
  }

  //? Método para hacer el pago con puntos
  void paydWithPoints() {
    _customer?.points = _customer!.points! - _customer!.pay!;
    notifyListeners();
  }

  //? Método para quemar un intento de juego
  void playGame(int intents) {
    _customer?.intents = _customer!.intents! - (1 + intents);
    notifyListeners();
  }

  void playNextIntent(int intents) {
    if (_customer!.intents! >= intents) {
      _customer?.intents = _customer!.intents! - intents;
    } else if ((_customer!.points! / _customer!.pointsPerGame!) > intents) {
      _customer?.points =
          _customer!.points! - (_customer!.pointsPerGame! * intents);
    }
    notifyListeners();
  }
}
