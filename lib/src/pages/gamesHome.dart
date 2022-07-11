/*
*/

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/fonts.dart';
import 'package:memory_game/src/widgets/dialogs/insufficientIntents.dart';
import 'package:memory_game/src/widgets/sliderPoints.dart';
import 'package:memory_game/src/widgets/dialogs/rules/rulesDialog.dart';
import 'package:provider/provider.dart';

class GamesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundHeader),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                gamesService.customer.points.toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2,
                                      color: Colors.black45,
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                'CrediPuntos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: sourceSansSemiBold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                gamesService.customer.intents.toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2,
                                      color: Colors.black45,
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                'Intentos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: sourceSansSemiBold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: gamesService.customer.points! >=
                                gamesService.customer.pointsPerGame!
                            ? const SliderConvertPoints()
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 300.0,
            //backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: AnimatedButton(
                  onPressed: () => rulesDialog(context).show(),
                  color: Colors.deepPurple.shade400,
                  height: 40,
                  width: 140,
                  child: const Text(
                    'Ayuda',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: 500,
                        alignment: const Alignment(1.1, 1.1),
                        margin: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 7,
                                offset: Offset(3, 5),
                                color: Colors.black38)
                          ],
                          image: const DecorationImage(
                            image: AssetImage(bannerFirstGame),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 175, 130),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            splashColor: Colors.white,
                            splashRadius: 10,
                            iconSize: 30,
                            color: Colors.white,
                            onPressed: () {
                              gamesService.customer.intents! > 0
                                  ? {
                                      Navigator.of(context)
                                          .pushNamed('cardsGame'),
                                      gamesService.playGame(0),
                                    }
                                  : insufficientsIntents(
                                          context: context, cancelFuntion: null)
                                      .show();
                            },
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 280,
                        margin: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 7,
                              offset: Offset(3, 5),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 280,
                        margin: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 7,
                              offset: Offset(3, 5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
