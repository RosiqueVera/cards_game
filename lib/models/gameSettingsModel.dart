//! Modelo de la configuración del juego
//? Declaración de las configuraciones para el juego
class GameSettingsModel {
  String? category;
  int? value;
  String? comments;
  int intents = 0;
  bool isFinish = false;

  //? Constructor del modelo
  GameSettingsModel({
    this.category,
    this.comments,
    this.value,
  });

  //? Método factory para obtener la información de un mapa de datos
  factory GameSettingsModel.fromMap(Map<String, dynamic> map) =>
      GameSettingsModel(
        category: map['category'] ?? 'Juego',
        comments: map['comments'] ?? 'Comentarios del juego',
        value: map['value'] ?? 1,
      );
}
