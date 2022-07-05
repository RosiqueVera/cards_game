//! Servicio de configuración del juego
//?Declaración del servicio
import 'package:flutter/material.dart';
import 'package:memory_game/models/gameSettingsModel.dart';

class GameCardSettingsService with ChangeNotifier {
  final GameSettingsModel _gameSettingsModel = GameSettingsModel(
    category: 'Juego de cartas',
    comments: 'Encuentra a Sol dorada y gana',
    value: 2,
  );

  //? Método para obtener la configuración del juego
  GameSettingsModel get cardGameSettings => _gameSettingsModel;
}
