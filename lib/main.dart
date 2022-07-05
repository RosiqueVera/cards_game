import 'package:flutter/material.dart';
import 'package:memory_game/services/gameCardSettingsService.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/pages/card-game.dart';
import 'package:memory_game/src/pages/gamesHome.dart';
import 'package:memory_game/src/pages/gamesMain.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:provider/provider.dart';

//? Función para ejecutar la aplicación
void main() {
  runApp(const MyApp());
}

//? Widget para construir configuración inicial de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GamesService(),
        ),
        ChangeNotifierProvider(
          create: (_) => GameCardSettingsService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Games',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: archivoBlack),
        initialRoute: 'main',
        routes: {
          'main': (_) => GamesMain(),
          'home': (_) => GamesHome(),
          'cardsGame': (_) => CardsGame(),
        },
      ),
    );
  }
}
