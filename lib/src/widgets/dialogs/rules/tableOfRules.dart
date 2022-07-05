import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';

//!Tabla de las reglas de los juegos
//?Widget que muestra la tabla de los juegos y credipuntos para ver las reglas
class TableOfRulesOnTheGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(bannerMemoryGame),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                subtitle: Text(
                  'Sol dorada',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(routlete),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                subtitle: Text(
                  'Ruleta',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        TableRow(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(jackpot),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                subtitle: Text(
                  'Jackpot',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(rulesCrediGames),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                subtitle: Text(
                  'CrediPuntos',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
