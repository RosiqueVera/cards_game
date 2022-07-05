import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/customerModel.dart';
import 'package:memory_game/services/pointsService.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/styles/colors.dart';
import 'package:memory_game/src/widgets/dialogs/confirmActionDialog.dart';
import 'package:memory_game/src/widgets/dialogs/points/insufficientsPointsDialog.dart';
import 'package:memory_game/src/widgets/dialogs/points/paymentMade.dart';
import 'package:provider/provider.dart';

//!Dialogo
//?Dialogo para redimir tus puntos (Convertir para abono a tu pago)

AwesomeDialog redeemPointsDialog(BuildContext context) {
  final GamesService gamesService =
      Provider.of<GamesService>(context, listen: false);
  final Customer customer = gamesService.customer;
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
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
              image: AssetImage(redeemPoints),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(2, 3),
                color: Colors.black54,
              )
            ],
          ),
        ),
        const ListTile(
          title: Text(
            'Redimir puntos',
            style: TextStyle(
              color: blackGray,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '¿Deseas realizar tu pago con los CrediPuntos?',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    btnOkText: 'Pagar',
    btnOkOnPress: () {
      gamesService.isPossiblepaymentWithPoints
          ? confirmActionDialog(
              context: context,
              success: () {
                gamesService.paydWithPoints();
                paymentMadeDialog(context).show();
              },
              successText: 'Realizar pago',
              cancel: () => null,
              cancelText: 'Cancelar',
              title: '¿Estás seguro de que deseas realizar el pago?',
              desc:
                  'Tras realizar el pago, te quedarán ${customer.points! - customer.pay!} CrediPuntos',
            ).show()
          : insufficientsPointsDialog(context).show();
    },
    btnCancelText: 'Cancelar',
    btnCancelOnPress: () => null,
  );
}
