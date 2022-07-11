//! Servicio de configuración del juego
//?Declaración del servicio
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/gameSettingsModel.dart';

class GameCardSettingsService with ChangeNotifier {
  final GameSettingsModel _gameSettingsModel = GameSettingsModel(
    category: 'Juego de cartas',
    comments: 'Encuentra a Sol dorada y gana',
    value: 5,
  );

  //? Método para obtener la configuración del juego
  GameSettingsModel get cardGameSettings => _gameSettingsModel;

  //?Método para determinar si el juego está terminado
  bool get isFinish => _gameSettingsModel.isFinish;

  //? Método para agregar un intento de juego
  void addIntent() {
    _gameSettingsModel.intents = _gameSettingsModel.intents + 1;
    notifyListeners();
  }

  //? Método para resetear los intentos en el juego
  void resetIntents() {
    _gameSettingsModel.intents = 0;
    notifyListeners();
  }

  //? Método para determinar si el juego ha terminado
  void finishGame(FlipCardController? flipCardController) {
    _gameSettingsModel.isFinish = true;
    resetIntents();
    flipCardController!.toggleCard();
    notifyListeners();
  }

  void resetGame() {
    _gameSettingsModel.isFinish = false;
    _gameSettingsModel.intents = 0;
    notifyListeners();
  }
}
