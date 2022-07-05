//! Modelo de los puntos e intentos de juego
//? Declaración del modelo
class Customer {
  int? intents;
  int? points;
  int? pointsPerGame;
  int? pay;
  int? pointsToConvert;

//? Constructor del modelo
  Customer({
    this.intents,
    this.points,
    this.pointsPerGame,
    this.pay,
    this.pointsToConvert,
  });

//? Método factory para obtener la información de un mapa de datos
  factory Customer.fromMap(Map<String, dynamic> map) => Customer(
        intents: map['intents'] ?? 1,
        points: map['point'] ?? 1,
        pointsPerGame: map['pointsPerGame'] ?? 1,
        pay: map['pay'] ?? 0,
      );
}
