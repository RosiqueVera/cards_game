/*
*/
import 'package:flutter/material.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/credipointsDetailsDialog.dart';
import 'package:memory_game/src/widgets/dialogs/insufficientIntents.dart';
import 'package:memory_game/src/widgets/dialogs/points/redeemDialog.dart';
import 'package:memory_game/src/widgets/dialogs/rules/rulesDialog.dart';
import 'package:provider/provider.dart';

class GamesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GamesService gamesService = Provider.of<GamesService>(context);
    return Scaffold(
      backgroundColor: lightYelow,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              snap: false,
              floating: true,
              centerTitle: true,
              expandedHeight: 180.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              title: const Text(
                'SALA DE JUEGOS',
                style: TextStyle(color: blackGray, fontSize: 18),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.fromLTRB(15, 6, 20, 6),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      child: const Text(
                        'Reglas',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'calibri',
                        ),
                      ),
                      onTap: () => rulesDialog(context).show(),
                    ),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 231, 205, 247),
                          Color.fromARGB(255, 127, 101, 243)
                        ],
                        tileMode: TileMode.mirror,
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomRight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage(
                              coins,
                            ),
                            height: 30,
                            color: lightYelow,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                gamesService.customer.points.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 45,
                                  color: lightYelow,
                                ),
                              ),
                              const Text(
                                'CrediPuntos',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Color.fromARGB(255, 154, 101, 229),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () =>
                                crediPointsDetailDialog(context).show(),
                            child: const Text('Detalles'),
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: Colors.deepPurple),
                            onPressed: () => redeemPointsDialog(context).show(),
                            child: const Text(
                              'Canjear',
                              style: TextStyle(
                                color: Color.fromARGB(255, 154, 101, 229),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                collapseMode: CollapseMode.parallax,
              )),
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
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 5, 175, 130),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                                splashColor: Colors.white,
                                splashRadius: 10,
                                color: Colors.white,
                                onPressed: () {
                                  gamesService.customer.intents! > 0
                                      ? {
                                          gamesService.playGame(),
                                          Navigator.of(context)
                                              .pushNamed('cardsGame'),
                                        }
                                      : insufficientsIntents(
                                              context: context,
                                              cancelFuntion: null)
                                          .show();
                                },
                                icon: Icon(
                                  Icons.play_arrow_rounded,
                                )),
                          )),
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
