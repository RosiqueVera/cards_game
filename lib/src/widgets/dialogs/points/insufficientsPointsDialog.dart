import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/customerModel.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:provider/provider.dart';

AwesomeDialog insufficientsPointsDialog(BuildContext context) {
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  final Customer customer = gamesService.customer;
  int points = customer.pay! - customer.points!;
  return AwesomeDialog(
    context: context,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    dialogType: DialogType.ERROR,
    body: Column(
      children: [
        Container(
          height: 180,
          width: 150,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(insufficientsPoints),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(2, 3),
                  color: Colors.black54,
                )
              ]),
        ),
        ListTile(
          title: const Text(
            'CrediPuntos insuficientes',
            style: TextStyle(
              color: blackGray,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Te faltan $points para poder cubrir tu pago',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    btnOkText: 'Entendido',
    btnOkOnPress: () => null,
  );
}
